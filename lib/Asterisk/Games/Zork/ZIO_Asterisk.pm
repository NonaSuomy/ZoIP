package Asterisk::Games::Zork::ZIO_Asterisk;
# z-machine i/o for dumb/semi-dumb terminals.

# to do: get rid of absolute Y (untrackable)


use strict;
use Carp qw(cluck);

use Games::Rezrov::GetKey;
use Games::Rezrov::GetSize;
use Games::Rezrov::ZIO_Tools;
use Games::Rezrov::ZIO_Generic;
use Asterisk::AGI;
use Digest::MD5 qw(md5_hex);

use IO::Socket;
use FileHandle;
use IPC::Open2;

use base qw(Games::Rezrov::ZIO_Generic);

my ($rows, $columns);
my ($clear_prog);

my $abs_x = 0;
my $abs_y = 0;
my $speaking = 0;

my $dtmf_translation = {
   "1" => "northwest",
   "2" => "north",
   "3" => "northeast",
   "4" => "west",
   "6" => "east",
   "7" => "southwest",
   "8" => "south",
   "9" => "southeast",
   "5" => "up",
   "0" => "down",
  "*09" => "quit",
  "*07" => "save",
  "*05" => "load",
  "*01" => "y",
  "*5665" => "look",
  "*6736" => "open window",
  "*36837" => "enter",
  "*8253" => "take all",
  "*4683" => "inventory",
};

$|=1;

sub new {
  my ($type, %options) = @_;
  my $self = new Games::Rezrov::ZIO_Generic(%options);
  bless $self, $type;

  $self->{AGI} = $options{AGI};
  $self->{AGI_PARAMS} = $options{AGI_PARAMS};
  $self->{CONFIG} = $options{CONFIG};
  $self->zio_options(\%options);
  $self->readline_init();

  $self->io_setup();
  
  $columns = $options{columns} if $options{columns};
  $rows = $options{rows} if $options{rows};
  ($columns, $rows) = get_size() unless $columns and $rows;
  # don't attempt to detect terminal size if manually set;
  # ("make test" crashes in Term::ReadKey if not run on a tty!)
  
  unless ($columns and $rows) {
    print STDERR "I couldn't guess the number of rows and columns in your display,\n";
    print STDERR "so you must use -rows and -columns to specify them manually.\n";
    exit;
  }
  return $self;
}

sub io_setup {
  my ($self) = @_;
  $clear_prog = find_prog("clear");
}

sub write_string {
  my ($self, $string, $x, $y) = @_;

  # Don't "speak" the > by itself."
  return if ( $string =~ /^>$/ );
  # BUG: What happens if we load a different game, eh??
  # Don't start speaking until we see the serial number
  if ( $string =~ /840726$/ ) {
    $speaking = 1;
    return;
  }
  return if $speaking != 1;

  $string =~ s/[^a-z0-9,\. ]//ig;  # Strip out non-alphanumeric characters
  if ( length($string) > 1 ) {
    $self->tts( $string );
  }
}

sub clear_to_eol {
}

sub update {
}

sub find_prog {
  # don't look
  foreach ("/bin/", "/usr/bin/") {
    my $fn = $_ . $_[0];
    return $fn if -x $fn;
  }
  return undef;
}

sub can_split {
  # true or false: can this zio split the screen?
  return 0;
}

sub set_version {
  my ($self, $status_needed, $callback) = @_;
  Games::Rezrov::StoryFile::rows($rows);
  Games::Rezrov::StoryFile::columns($columns);
  return 0;
}

sub absolute_move {
}

sub newline {
  # check to see if we need to pause
  # spd ---
  # There is no such thing as a newline in the speach world!
  # spd ---
  # print "\n";
  $abs_x = 0;
  Games::Rezrov::StoryFile::register_newline();
}

sub write_zchar {
  if ($_[0]->current_window() == Games::Rezrov::ZConst::LOWER_WIN) {
    print chr($_[1]);
    $abs_x++;
  }
}

sub get_input {
  my ($self, $max, $single_char, %options) = @_;
  if ($single_char) {
    return get_key();
  } else {
    my $line;
      #
      # THIS IS WHERE WE WILL BE READING DTMF, AND USING SPYNX FOR SPEACH-TO-TEXT
      #
      #$line = <STDIN>;
      do {
         $self->{AGI}->stream_file("beep");
         my $recording = "/tmp/recording-" . $self->{AGI_PARAMS}->{calleridnum} . "-" . $self->{AGI_PARAMS}->{uniqueid};
         $self->{AGI}->exec("monitor", "wav,$recording");
         $self->{AGI}->exec("backgrounddetect", $self->{CONFIG}->{path} . "/share/sounds/silence/10");
         $self->{AGI}->exec("stopmonitor");
         $line = &asr( "$recording-in.wav" );
         # In theory this should be better than using monitor/background
         # detect. but in practice, the talkoff detection doesn't seem to work
         # quite right.
         #
         # Maybe we can use detectSilence so that someone can start talking at
         # the 10th second, and not be interrupted by teh computer saying
         # tick-tock
         #
         # $self->{AGI}->exec("record", "$recording.wav,1,10,q" );
         # $line = &asr( "$recording.wav" );
         $self->{AGI}->verbose("Zasterisk: Sphinx returned: [$line]", 1);
         if ( length($line) > 0 ) {
            $self->tts( "You said:" );
            $self->tts( "$line" );
            $line = $self->handle_special_keywords($line);
         }
         $self->tts( "tick tock" ) unless ( length($line) > 0 );
      } until( length( $line ) > 0 );
    return $line;
  }
}

sub get_position {
  my ($self, $sub) = @_;
  if ($sub) {
    return sub { };
  } else {
    return ($abs_x, $abs_y);
  }
}

sub clear_screen {
}

sub set_window {
  my ($self, $window) = @_;
  $self->SUPER::set_window($window);
  if ($window != Games::Rezrov::ZConst::LOWER_WIN) {
    # ignore output except on lower window
    unless ($self->warned()) {
      $self->warned(1);
      my $pb = Games::Rezrov::StoryFile::prompt_buffer();
      $self->newline();
      Games::Rezrov::StoryFile::set_window(Games::Rezrov::ZConst::LOWER_WIN);
      my $message = "WARNING: this game is attempting to use multiple windows, which this interface can't handle. The game may be unplayable using this interface.  You should probably use the Tk, Curses, Termcap, or Win32 interfaces if you can; see the documentation.";
      $self->SUPER::buffer_zchunk(\$message);
      Games::Rezrov::StoryFile::flush();
      $self->newline();
      Games::Rezrov::StoryFile::prompt_buffer($pb) if $pb;
      Games::Rezrov::StoryFile::set_window($window);
    }
  }
}

sub erase_chars {
  my $count = shift;

  print pack 'c', 0x0d;      # carriage return
  print ' ' x $count;      # erase
  print pack 'c', 0x0d;      # carriage return
  # 2nd pass required in case of user input on same line as more prompt;
  # example: start "enchanter" in 80x36 terminal.
  # I'm not sure why just sending $count 0x08's (backspace) doesn't
  # work in this case, but it doesn't.
}

sub cleanup {
}

sub warned {
  return (defined $_[1] ? $_[0]->{"warned"} = $_[1] : $_[0]->{"warned"});
}

sub translate_dtmf {
   my $self = shift;
   my ( $string ) = @_;
   my $trans = $dtmf_translation->{$string};
   if( defined( $trans ) ) {
      $self->write_string( $trans );   # Echo what the user's dtmf was expanded to.
      return $trans;
   } else {
      return undef;
   }
}

sub asr {
   my $file = shift;
   my $host = 'localhost';
   my $port = '1069';
   my $fh;
   my $count;
   my $result = undef;
   my $remote =  IO::Socket::INET->new(
      Proto    => "tcp",
      PeerAddr => $host,
      PeerPort => $port,
   ) or die "Unable to open inet socket";

   open( $fh, $file ) || die ( "Couldn't open $file" );
   binmode $fh;
   binmode $remote;

   $count = 0;
   my $wavfile = undef;
   while (defined(my $b = read $fh, my($buf), 4096)) {
      last if $b == 0;
      $count += $b;
      $wavfile .= $buf;
   }
   close $fh;
   print $remote length($wavfile) . "\n";
   print $remote $wavfile;

   $count=0;
   while (defined(my $b = read $remote, my($buf), 4096)) {
      last if $b == 0;
      $count += $b;
      $result .= $buf;
   }
   $result =~ s/\s*$//; # For some reason, I'm getting trailing spaces back
   $result = lc($result);

   close $remote;
   return $result;
}

sub tts {
   my $self = shift;
   my ( $string ) = @_;
   my $tts;
   $self->{AGI}->verbose("Zasterisk: -->$string<--", 1);
   my $cached_file = $self->{CONFIG}->{tts_cache} . "/tts-" . md5_hex($string);
   if( $self->{CONFIG}->{tts_engine} eq "cepstral" ) {
      $tts = sprintf( $self->{CONFIG}->{cepstral} . " -n David -m text -f %s.txt -o %s.wav -p audio/channels=1,audio/sampling-rate=8000", $cached_file, $cached_file );
   }
   elsif( $self->{CONFIG}->{tts_engine} eq "festival" ) {
      $tts = sprintf( $self->{CONFIG}->{festival} . " %s.txt -F 8000 -o %s.wav", $cached_file, $cached_file );
   }
   else {
      die "Unknown text-to-speech engine $self->{CONFIG}->{tts_engine}";
   }
   unless( -f "$cached_file.wav" ) {
      $self->{AGI}->verbose("Zasterisk: Generating new file", 3);
      open( FH, ">$cached_file.txt" );
      print FH $string;
      close( FH );
      system( $tts );
   } else {
      $self->{AGI}->verbose("Zasterisk: Playing cached file", 3);
   }
   $self->{AGI}->stream_file( $cached_file, '#' );
}

sub handle_special_keywords {
   my $self = shift;
   my ( $line ) = @_;

   if ( $line =~ /^save$/ ) {
      $self->tts( "Please enter a 5 digit username, followed by the pound key." );
      $self->{AGI}->exec("waitexten", "3");
      my $uid = $self->{AGI}->get_data( $self->{CONFIG}->{path} . '/share/sounds/silence/10', 3000, 5);
      $self->tts( "Please enter a 4 digit password, followed by the pound key." );
      my $pin = $self->{AGI}->get_data( $self->{CONFIG}->{path} . '/share/sounds/silence/10', 3000, 4);
      $self->tts( "You entered a username of" );
      $self->tts( $uid );
      $self->tts( "and a password of" );
      $self->tts( $pin );
      $uid =~ s/[^\d]//;
      $pin =~ s/[^\d]//;
      $self->{save_filename} = sprintf("%d-%d", $uid, $pin );
   }
   return $line;
}

1;
