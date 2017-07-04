#!/usr/bin/perl

# sphinx-netserver.pl 
# Copyright (c) 2005 Josh McAllister
#
# This program is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# Written by Josh McAllister <josh208@gmail.com>

use IO::Socket;
use Symbol;
use POSIX;
use Proc::Daemon;
use Config::Tiny;
use FindBin;
use Speech::Recognizer::SPX qw(:uttproc :fbs);

# not used by anything $SPHINX_DIR='/usr/share/sphinx2';
my $config = Config::Tiny->read( $FindBin::Bin . '/etc/zoip.conf' );
my $SPHINX_MODELS = $FindBin::Bin . "/share/sphinx2";

# ensure that the language model and hmm directories exist before we proceed
die "Missing language model $SPHINX_MODELS/model/lm/zork" unless ( -d "$SPHINX_MODELS/model/lm/zork" );
die "Missing hmm model $SPHINX_MODELS/model/hmm/communicator" unless ( -d "$SPHINX_MODELS/model/hmm/communicator" );

# Daemonize
Proc::Daemon::Init if ( $config->{sphinx}->{daemonize} == 1 );

# establish SERVER socket, bind and listen.
$server = IO::Socket::INET->new(LocalPort => $config->{sphinx}->{socket} || 1069,
                                Type      => SOCK_STREAM,
                                Proto     => 'tcp',
                                Reuse     => 1,
                                Listen    => 10 )
  or die "making socket: $@\n";

# global variables
$PREFORK                = $config->{sphinx}->{children_prefork} || 2;        # number of children to maintain
$MAX_CLIENTS_PER_CHILD  = $config->{sphinx}->{max_clients_per_child} || 50;  # number of clients each child should process
%children               = ();       # keys are current child process IDs
$children               = 0;        # current number of children

sub REAPER {                        # takes care of dead children
    $SIG{CHLD} = \&REAPER;
    my $pid = wait;
    $children --;
    delete $children{$pid};
}

sub HUNTSMAN {                      # signal handler for SIGINT
    local($SIG{CHLD}) = 'IGNORE';   # we're going to kill our children
    kill 'INT' => keys %children;
    exit;                           # clean up with dignity
}
    
# Fork off our children.
for (1 .. $PREFORK) {
    make_new_child();
}

# Install signal handlers.
$SIG{CHLD} = \&REAPER;
$SIG{INT}  = \&HUNTSMAN;

# And maintain the population.
while (1) {
    sleep;                          # wait for a signal (i.e., child's death)
    for ($i = $children; $i < $PREFORK; $i++) {
        make_new_child();           # top up the child pool
    }
}

sub make_new_child {
    my $pid;
    my $sigset;
    
    # block signal for fork
    $sigset = POSIX::SigSet->new(SIGINT);
    sigprocmask(SIG_BLOCK, $sigset)
        or die "Can't block SIGINT for fork: $!\n";
    
    die "fork: $!" unless defined ($pid = fork);
    
    if ($pid) {
        # Parent records the child's birth and returns.
        sigprocmask(SIG_UNBLOCK, $sigset)
            or die "Can't unblock SIGINT for fork: $!\n";
        $children{$pid} = 1;
        $children++;
        return;
    } else {	#Child
        # Child can *not* return from this subroutine.
        $SIG{INT} = 'DEFAULT';      # make SIGINT kill us as it did before
    
        # unblock signals
        sigprocmask(SIG_UNBLOCK, $sigset)
            or die "Can't unblock SIGINT for fork: $!\n";
   
        # Initialize sphinx 
	fbs_init({-live         => 'FALSE',
          -samp         => 8000,
          -adcin        => 'TRUE',
          -ctloffset    => 0,
          -ctlcount     => 100000000,
          -cepdir       => "$SPHINX_MODELS/model/lm/zork",
          -datadir      => "$SPHINX_MODELS/model/lm/zork",
          -agcmax       => 'FALSE',
          -langwt       => 6.5,
          -fwdflatlw    => 8.5,
          -rescorelw    => 9.5,
          -ugwt         => 0.5,
          -fillpen      => 1e-10,
          -silpen       => 1e-10, #0.005,
          -inspen       => 0.65,
          -top          => 1,
          -topsenfrm    => 3,
          -topsenthresh => -70000,
          -beam         => 2e-06,
          -npbeam       => 2e-06,
          -lpbeam       => 2e-05,
          -lponlybeam   => 0.0005,
          -nwbeam       => 0.0005,
          -fwdflat      => 'FALSE',
          -fwdflatbeam  => 1e-08,
          -fwdflatnwbeam=> 0.0003,
          -bestpath     => 'TRUE',
          -kbdumpdir    => "$SPHINX_MODELS/model/lm/zork",
          -lmfn         => "$SPHINX_MODELS/model/lm/zork/zork.lm",
          -dictfn       => "$SPHINX_MODELS/model/lm/zork/zork.dic",
          -phnfn        => "$SPHINX_MODELS/model/hmm/communicator/phone",
          -mapfn        => "$SPHINX_MODELS/model/hmm/communicator/map",
          -hmmdir       => "$SPHINX_MODELS/model/hmm/communicator",
          -hmmdirlist   => "$SPHINX_MODELS/model/hmm/communicator",
          -ndictfn      => "$SPHINX_MODELS/model/hmm/communicator/noisedict",
          '-8bsen'      => 'TRUE',
          -sendumpfn    => "$SPHINX_MODELS/model/hmm/communicator/sendump",
          -cbdir        => "$SPHINX_MODELS/model/hmm/communicator"});

        # handle connections until we've reached $MAX_CLIENTS_PER_CHILD
        for ($i=0; $i < $MAX_CLIENTS_PER_CHILD; $i++) {
           my $buf = undef;
           $client = $server->accept() or last;
	   uttproc_begin_utt();
	   my $count = 0;
           my $datasize = readline $client;
           chomp $datasize;
           my $b = read ($client, my($buf), $datasize);
           #print "SERVER DEBUG: Expecting $datasize bytes, got $b bytes.\n";
	   uttproc_rawdata($buf, 1) or die "uttproc_rawdata failed";
           uttproc_end_utt();
	   my ($fr, $hyp) = uttproc_result(1);
	   #print "frames $fr\n";
           print STDERR "SERVER RESULT: $hyp\n";
           print $client "$hyp";
	   close $client;
        }
        # tidy up gracefully and finish
    
        # this exit is VERY important, otherwise the child will become
        # a producer of more and more children, forking yourself into
        # process death.
        fbs_end();
	print STDERR "======= \n";
	print STDERR "======= CHILD ENDED\n";
	print STDERR "======= \n";
        exit;
    }
}
