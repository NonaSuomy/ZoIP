package Asterisk::Games::Zork::ZIO_StrippedDown;
# z-machine i/o for dumb/semi-dumb terminals.

# to do: get rid of absolute Y (untrackable)

use strict;
use Carp qw(cluck);

use Games::Rezrov::GetKey;
use Games::Rezrov::GetSize;
use Games::Rezrov::ZIO_Tools;
use Games::Rezrov::ZIO_Generic;

use base qw(Games::Rezrov::ZIO_Generic);

my ($rows, $columns);
my ($clear_prog);

my $abs_x = 0;
my $abs_y = 0;

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
  "*9" => "quit",
  "*7" => "save",
  "*5" => "load",
	"*1" => "y",

};

$|=1;

sub new {
  my ($type, %options) = @_;
  my $self = new Games::Rezrov::ZIO_Generic(%options);
  bless $self, $type;

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
  # FESTIVAL HOOK
  #
  # Call Festival Here, and play back audio to user.
  #
  # Don't "speak" the > by itself."
  return if ( $string =~ /^>$/ );
 $string =~ s/[^a-z0-9,\. ]//ig; # Strip out non-alphanumeric characters
  print "SPEAKING: -->$string<--\n";
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
    print STDERR "WAITING FOR DTMF: ";
    $line = <STDIN>;
    unless (defined $line) {
      $line = "";
    }
    chomp $line;
    # Translate any special DTMF sequences to Zork phrases
    my $result = $self->translate_dtmf( $line );
    $line = $result if ( defined( $result ) );
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

  print pack 'c', 0x0d;		# carriage return
  print ' ' x $count;		# erase
  print pack 'c', 0x0d;		# carriage return
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
		$self->write_string( $trans );	# Echo what the user's dtmf was expanded to.
		return $trans;
	} else {
		return undef;
	}
}

1;
