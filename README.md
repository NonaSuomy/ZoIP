# ZoIP
Asterisk Zork Server made by Simon P. Ditner.

# 10 Year Old Code Revival #

## ZoIP.org ##

Recovered data from the internet archive.

https://web.archive.org/web/20070707203310/http://uc.org/read/ZoIP

Uploaded here: https://github.com/NonaSuomy/ZoIP/

https://github.com/NonaSuomy/ZoIP/archive/master.zip

**Note:** *I have no connections with Simon P. Ditner, but if he's reading this, this project was pretty slick, great work! Hope you don't mind that I dug this back up and posted it. I found him [here](https://github.com/spditner)* for anyone looking.

**Old Stuff From Website Start** 

### Home Page ###

```
ZoIP/Zasterisk & the great undergroup empire

Wednesday June 6th, 2007

Digium noticed ZoIP!

"Game Play

Do you miss the good 'ole days of text based computer games? Or maybe you would like to find a way to use your time effectively while waiting on hold. Simon Ditner, a speaker at the IT360 conference in Toronto, recently described how you can play games over the phone system for both fun and for points.

Ditner recently created a game called Zoip (a blending of Zork and VoIP) which brings back to life the original Infocom game Zork. Zork, a text-based game, was originally a difficult game which relied on your imagination and ability to solve word puzzles in order to succeed. Zoip utilizes Asterisk coupled with speech recognition and text-to-speech technology to play the Zork game."

http://hardware.digium.com/?elqPURLPage=18
Friday May 4th, 2007

I gave another talk on ZoIP at IT360 in Toronto this past Wednesday. If you're looking for the slides to that talk, they here here:

zoip talk 3 slides
zoip talk 3 handouts
There was also a writeup in Eartheweb IT Management on my talk.

Thursday October 26th, 2006

I spoke at Astricon 2006 in Dallas, Texas today. If you're looking for the slides, there are two parts:

sprec slides
zoip slides
Wednesday October 25th, 2006

I tested ZoIP with Inform 7, outputting in the z5 format, and it appears to mostly work. I created a simple office and was able to navigate around a 4 room. Test it out for yourself, and let me know how it goes: Inform 7

Update: You will have to edit 'Asterisk/Games/Zork/ZIO_Asterisk.pm', and change $speaking = 0 to $speaking = 1, or alternatively, add your serial number to the "if ( $string =~ /840726$/ ) {" regex to skip over reading the zmachine version number, and such, when the game first starts. (Thanks to Paul C. for pointing out that it didn't work as advertised ;-) )

Wednesday September 27th, 2006

I gave a talk on sprec and ZoIP to the Toronto Asterisk Users Group using the Lawrence Lessig style after being inspired by Dave Gray and Dick Hardt. You can download it if you like. It was well recieved. I'll likely polish it up and present it at Astricon next month.

Sunday September 17th, 2006

Version 0.2.1 has been released. I discovered that Zork isn't abandonware -- Activision owns all the copywrites, so I've removed it from the distribution.

[ More News ]

ZoIP - a telephony/text adventure bridge for Asterisk and Infocom games

ABOUT

ZoIP (formerly Zasterisk) implements a Rezrov ZIO object, allowing a user to communicate with a Z-Machine via telephony devices.

I was tinkering with Asterisk and the Festival text-to-speech engine, and wrote some short Asterisk::AGI scripts to read back live weather reports. After that, I thought I needed something more interactive to work with...

Then I had a flashback to 1996, first year university, standing in the C & O club at the University of Waterloo, where someone had just pulled out their US Robotics Palm Pilot and started up Zork. A couple of hours later, after a quick trip to the campus computer store, I was playing Zork in the palm of my hand!

Now Zork is back! Listen as the eerie voice of Festival takes you into the Underground Empire, and marvel as you explore this world with your dial pad, unlocking the secrets within! What will Asterisk bring us next? The future is open!

DOWNLOAD

ZoIP 0.2.1, September 17th, 2006
ZoIP 0.2.0, September 5th, 2006
ZoIP 0.1.0, August 7th, 2005
PREREQUISITES

A working installation of Asterisk
A working installation of Festival, and Sphinx2
Asterisk::AGI (http://asterisk.gnuinter.net/files/asterisk-perl-0.08.tar.gz)
Speech::Recognizer::SPX, Config::Tiny, Proc::Daemon
REVISION HISTORY

0.2.1 September 17th, 2006

Had to remove Zork gamefile, as it's not freeware/abandonware
0.2.0 September 5th, 2006

Added Sphinx2 support
Added support for Cepstral.com TTS voices
Added configuration file and removed all hardcoded values
0.1.0 Summer, 2005

Implemented basic ZIO object which communicates with asterisk via Asterisk::AGI
MAKING CUSTOM LANGUAGE MODELS

Make a list of words
Submit them to http://www.speech.cs.cmu.edu/tools/lmtool.html
Download the tar file
Place the contents in share/model/lm/zork
Rename all the files to start with zork
COPYRIGHT

Copyright (c) 2005-2006 Simon P. Ditner <simon@uc.org>. All rights reserved. This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

The CMU hmm model 'communicator' has been bundled for ease of installation. (c)1999-2001 Carnegie Mellon University. See README.sphinx for license details.

Rezrov has been bundled with this package for ease of installation. Please see README.rezrov for further details concerning it.
```

## News Page ##

```
zee great undergroup empire

Wednesday September 27th, 2006

I gave a talk on sprec and ZoIP to the Toronto Asterisk Users Group using the Lawrence Lessig style after being inspired by Dave Gray and Dick Hardt. You can snag a copy of it here if you like: Download. It was well recieved. I'll likely polish it up and present it at Astricon next month.

Sunday September 17th, 2006

Version 0.2.1 has been released. I discovered that Zork isn't abandonware -- Activision owns all the copywrites, so I've removed it from the distribution.

Tuesday September 5th, 2006

The long-delayed ZoIP 0.2.0 has been released. It's quite a bit larger, as I've bundled a Sphinx2 language model to make installation more straight forward. Please direct comments, patches, and such to simon-zoip at uc dot org

Sunday July 16th, 2006

Rodney Degracia has set up a support forum to help anyone trying to set up ZoIP on their own system.

Tuesday June 13th, 2006

A few enhancements:

Sentences are no longer broken up into 60 character chunks, so speaking should be more fluid
What the computer thinks you said is now echoed back to you
You can now skip over segments of talking by pressing #
Friday June 9th, 2006

The demo server is up running the 0.2 beta! There are many ways to call in, see the demo page for access numbers and a brief introduction to gameplay.

Tuesday June 6th, 2006

Oh look at that, I've been linked to by boingboing, makezine, and digg. Now I feel bad that I don't have the demo online yet. Send an email to simon-zoip@uc.org, and I'll email you when it's up.

Monday March 13th, 2006

I had a couple of donations from the community over the last few months. First, voices from cepstral.com? -- they're much easier to understand than Festival's, and the second is a server with inbound lines! So, over the next few weeks I'll be putting a public beta online for you to call in to.

I'm also going to rename the project to 'zoip', since the ideas I'm working on aren't really asterisk specific.

-- simon

Sunday October 9th, 2005

Over Thanksgiving(.ca), I've had the time to do some further research into Sphinx/Asterisk integration. I came across Josh's example earlier today, which uses the Speech::Recognizer::SPX perl module. SPX is a perl wrapper for the sphinx2 continuous speech recognition engine C API, and I was able to get Josh's examples running with my own small cardinal directions dictionary and Asterisk within a couple of hours.

My family likely thinks I've gone a bit crazy, as I pace around the house with a cordless phone yelling "north!" "north!".

I'll likely integrate the results into ZoIP tomorrow, and bundle it up as 0.2

-- simon

Sunday August 7th, 2005

I was tinkering with Asterisk and the Festival text-to-speech engine, and wrote some short Asterisk::AGI scripts to read back live weather reports. After that, I thought I needed something more interactive to work with...

Then I had a flashback to 1996, first year university, standing in the C & O club at the University of Waterloo, where someone had just pulled out their US Robotics Palm Pilot and started up Zork. A couple of hours later, after a quick trip to the campus computer store, I was playing Zork in the palm of my hand!

Now Zork is back! Listen as the eerie voice of Festival takes you into the Underground Empire, and marvel as you explore this world with your dial pad, unlocking the secrets within! What will Asterisk bring us next? The future is open!

Note that some more commands need to be implemented before you can actually -enter- the underground empire. For now you can just futz around on the surface. See $dtmf_translation in Asterisk/Games/Zork/ZIO_Asterisk.pm for number-to-phrase translations.

-- simon
```

Demo Page

```
zee great undergroup empire

Feedback

Your feedback is important to help us improve quality and useability, send comments to simon-zoip@uc.org

If you have comments about your particular session, please include your phone number and time that you called so that we can examine the recordings.

Playing

Important tips for accurate recognition:

Use a good phone or headset
Speaking naturally. Careful enunciation actually seems to make things worse
Don't crank your handset's volume. Turning up the volume can cause clipping making recognition nearly impossible
Gameplay:

Listen to the speaking, you can skip over segments by pressing #
Wait for the <BEEP>, and speak your command, then press #
In these sorts of games, it's all about verbing the nouns. For example 'take X', 'move Y', 'open Z'

The command dictionary is presently very small. If you can't do something you want to, just let me know the words you need. You can use any combination of the following:

all bottle door down east inventory kill lantern leaflet look mailbox move north off on open read rug sack south sword take trap troll turn up west window with

Short WalkThru:

Here's a script to get you in the house and killing the troll:

 north
 east
 (behind house)
 open window
 west
 (in the kitchen)
 west
 (living room)
 take lantern
 take sword
 move rug
 open trapdoor
 down
 (dark place)
 turn on lantern
 north
 kill troll with sword
Connecting

Sorry, the demo is presently down, in the midst of rearranging things on that server (2009-04-24)

By telephone:

416-548-7557 (Toronto, Ontario, Canada) -- best quality
989-720-0771 (Saginaw, Michigan, USA) -- Via Telesthetic.com
360-226-7386 (WA, USA) -- Via IPKall.com, a little choppy
Via SIP, or IAX:

zoip@demo.zoip.org
```

Tasks Page

```
Tasks

(^) Update zoip sphinx daemon to load the language model and hmm dictionary from local path
(^) Copy zork lm into zasterisk CVS
(-) Check license for communicator 'hmm'
(-) bundle 'hmm' if possible, otherwis add as an additional download
(^) Update sphinx to daemonize
(-) Add logging functionality to sphinx daemon using Log::Log4perl
(^) Fix absolute path for silence/10.gsm
(^) Document creation of tts cache directory; Made it a configuration value
(^) Create configuration file; decided on Config::Tiny
(^) Add code to choose between Cepstral and Festival voices; added to etc/zoip.conf
(^) Document launching festival with a custom configuration file not necessary
(^) Determine how to start festival using a custom configuration file; not necessary
(-) Evaluate SVN+Trac system using vmware (I think I have a vmware appliance to try this out on)
(-) Should there be adsense on the site to offset costs?
Key: (^) = Done; (-) = Pending

Wishlist

Conferencing with "Meet Me" or "Conference"
Need some way to join/exit the conference
Need a conference room for each room id
Save game
Clipping detection
Larger vocabularies
Connect to a MUD/MOO
AJAX Interface to see your interaction in realtime
Look at googles AJAX api
Maybe send messages using Jabber
Pin Authentication
Voice fingerprint/phrase for verification?
My test environment

Note: I run this on a vmware instance inside a private network, so beware, what I describe is not a hardened system.

I use the pre-installed Ubuntu 6.06 LTS Server in a vmware machine:

http://www.vmware.com/vmtn/appliances/directory/451 (vmware directory)
http://www.thoughtpolice.co.uk/vmware/ (project hompage)
Pre-Configuration:

 $ sudo su -
 # vi /etc/apt/sources.list
   > enable the universe repositories
 # apt-get update
 # apt-get install \
      openssh-server \
      screen \
      cvs \
      build-essential \
      perl-doc
 # apt-get install libproc-daemon-perl liblog-log4perl-perl libconfig-tiny-perl
 # apt-get install asterisk
 # vi /etc/default/asterisk
 < RUNASTERISK=no
 > RUNASTERISK=yes
 < #RUNASTSAFE=yes
 > RUNASTSAFE=yes
 # /etc/init.d/asterisk start
 # cpan      # <-- run through a "normal" CPAN configuration
ZoIP Configuration:

 See INSTALL file in the tarball
```

### Notes on Sphinx2 Page ###

```
Notes on Sphinx2

Creating Language Models

 How to build the language model/dictionary for sphinx2:
    http://www.speech.cs.cmu.edu/sphinx/doc/sphinx-FAQ.html
    Sphinx2 only needs a pronounciation dictionary (.dict), and a language model (.lm)
 Building a dictionary:
 http://www.speech.cs.cmu.edu/cgi-bin/cmudict
    ftp://ftp.cs.cmu.edu/afs/cs.cmu.edu/data/anonftp/project/fgdata/dict/
       ftp://ftp.cs.cmu.edu/afs/cs.cmu.edu/data/anonftp/project/fgdata/dict/cmudict.0.6.gz
       You would grep the dictionary for your words
       Strip out the stress numbers
 Building language models
 http://www.speech.cs.cmu.edu/SLM/toolkit.html
    http://www.speech.cs.cmu.edu/SLM/CMU-Cam_Toolkit_v2.tar.gz
 cat output/zork.corpus | ./text2wfreq > output/zork.wfreq
 cat output/zork.wfreq | ./wfreq2vocab -top 20000 > output/zork.vocab
 cat output/zork.corpus | ./text2idngram -vocab output/zork.vocab > output/zork.idngram
 ./idngram2lm -idngram output/zork.idngram -vocab output/zork.vocab -binary output/zork.binlm
 ./idngram2lm -idngram output/zork.idngram -vocab output/zork.vocab -arpa output/zork.lm

```

**Old Stuff From Website End** 


## Let's see what trouble we can get into ##

### Original Directions ###

```
INSTALLING ZoIP ON DEBIAN-BASED SYSTEMS
---------------------------------------

1. Extract the ZoIP tarball to a suitable location

   i.e.
   
      mkdir -p /usr/local/games
      cd /usr/local/games
      tar -xzf <path to archive>/zoip.tar.gz
      ln -s zoip-<version> zoip

2. Copy the example configuration file zoip/etc/zoip.conf.example to
   zoip/etc/zoip.conf, and change values as you see fit. The defaults should
   meet your immediate needs.

3. Install Sphinx2, and Festival

   Install the Sphinx2 binaries and developer kit

      apt-get install sphinx2-bin libsphinx2-dev

   Install the Sphinx2 Perl bindings

      wget http://search.cpan.org/CPAN/authors/id/D/DJ/DJHD/Speech-Recognizer-SPX-0.0801.tar.gz
      tar -xzf Speech-Recognizer-SPX-0.0801.tar.gz
      cd Speech-Recognizer-SPX-0.0801
      perl Makefile.PL --sphinx-prefix=/usr
      make && make test && make install

   Install Festival, and the 'kallpc8k' voice, sitable for telephone quality

      apt-get install festival festvox-kallpc8k

4. Install the Asterisk::AGI perl module

      wget http://asterisk.gnuinter.net/files/asterisk-perl-0.08.tar.gz
      tar -xzf asterisk-perl-0.08.tar.gz
      cd asterisk-perl-0.08
      perl Makefile.PL
      make && make test && make install 

5. Add some additional perl modules used by ZoIP from the apt repository

      apt-get install libproc-daemon-perl liblog-log4perl-perl libconfig-tiny-perl

6. Start the Sphinx2 daemon in a separate console. By default, it is set to NOT
   daemonize, and will print all sorts of messages to the console. If you want
   it to daemonize, set daemonize=1 in the [sphinx] section of zoip.conf

      /usr/local/games/zoip/sphinx_server.pl

7. Find some z-machine games to play! 

   Various games can be found around the net, simply search for 'interactive
   fiction', 'infocom', 'zork' and such things. The only part you will need is
   the .DAT file. Move them into the share/games folder in the zoip directory.

   We will bundle games once we find some that are licensed for free
   redistribution. 

8. Add ZoIP to your asterisk dialplan (usually in /etc/asterisk/extensions.conf),
   and specify a gamefile to play. zoip.agi will look for the game file in it's
   share/games folder, or alternatively, at the full path that you specify.

   i.e.
   
      [default]
      exten => 300,1,AGI(/usr/local/games/zoip/zoip.agi|ZORK1.DAT)

9. Tell asterisk to reload it's extensions.conf

      asterisk -rx 'extensions reload'

10. Call extension 300, and enjoy!

DEBUGGING:
---------

1. Turn verbosity up to '1' from the asterisk console, and try calling in again. 

*CLI> set verbose 1

2. Try executing the script from the command line, and pressing enter a few
   times. You should see something like this:

$ ./zoip.agi ZORK1.DAT
VERBOSE "Zasterisk: -->West of House<--" 1
VERBOSE "Zasterisk: Playing cached file" 3
STREAM FILE /tmp/tts-4c13ad036f18f1b89490f1c6695173a0 #
VERBOSE "Zasterisk: -->You are standing in an open field west of a white house, with a boarded front door.<--" 1
VERBOSE "Zasterisk: Playing cached file" 3
STREAM FILE /tmp/tts-cbb9348ec36370d73425191b52bc7839 #
VERBOSE "Zasterisk: -->There is a small mailbox here.<--" 1
VERBOSE "Zasterisk: Playing cached file" 3
STREAM FILE /tmp/tts-e4f43f74dcfe3941013064fe5b1de8df #
STREAM FILE beep ""
EXEC monitor wav|/tmp/recording--
EXEC backgrounddetect /home/simon/zasterisk/share/sounds/silence/10
EXEC stopmonitor ""
Couldn't open /tmp/recording---in.wav at /home/simon/zasterisk/lib/Asterisk/Games/Zork/ZIO_Asterisk.pm line 267, <STDIN> line 14.
```

### Let's begin! ###

The first issue we will make for ourselves is were going to be using Scientific Linux 6.7 just to make this difficult.

```
Connected to Asterisk 13.7.2 currently running on IncrediblePBX
```

To get a quick VoIP Server going were going to use [IncrediblePBX13.2](https://sourceforge.net/projects/pbxinaflash/files/IncrediblePBX13-12%20with%20Incredible%20PBX%20GUI/).

http://nerdvittles.com/?p=15587

After you get that going, you can attempt ZoIP.

**Note:** *The step numbers below are in sequence of the Install document above and not in actual number order if you're wondering.*

#### Step 1 ####

Extract The ZoIP Tarball To A Suitable Location

```
mkdir -p /usr/local/games
cd /usr/local/games
wget https://web.archive.org/web/20070707203310/http://demo.zoip.org/zoip-0.2.1.tar.gz
tar -xzf zoip-0.2.1.tar.gz
ln -s zoip-0.2.1 zoip
```

or grab it from here: https://github.com/NonaSuomy/ZoIP/archive/master.zip

```
wget https://github.com/NonaSuomy/ZoIP/archive/master.zip
unzip master.zip
```

Easy enough.

#### Step 2 ####

Copy the example configuration file zoip/etc/zoip.conf.example to zoip/etc/zoip.conf, and change values as you see fit. The defaults should meet your immediate needs.

```
cp /usr/local/games/zoip-0.2.1/etc/zoip.conf.example /usr/local/games/zoip-0.2.1/etc/zoip.conf
```

Great were still in this game.

#### Step 3,4,5 ####

Install Sphinx2, and Festival.

Download sphinx2 version 0.6 from:

http://sourceforge.net/project/showfiles.php?group_id=1904

https://sourceforge.net/projects/cmusphinx/files/sphinx2/0.6/

```
cd /usr/local/src
wget -O sphinx2-0.6.tar.gz https://downloads.sourceforge.net/project/cmusphinx/sphinx2/0.6/sphinx2-0.6.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2Fsphinx2%2F0.6%2F&ts=1499126700&use_mirror=pilotfiber
```

Untar it.

```
tar -zxvf sphinx2-0.6.tar.gz
cd sphinx2-0.6
./configure –prefix=/usr/local/sphinx
make
make install
```

This will install sphinx into /usr/local/sphinx.

Install the Sphinx2 Perl bindings.

```
wget http://search.cpan.org/CPAN/authors/id/D/DJ/DJHD/Speech-Recognizer-SPX-0.0801.tar.gz
tar -xzf Speech-Recognizer-SPX-0.0801.tar.gz
cd Speech-Recognizer-SPX-0.0801
perl Makefile.PL --sphinx-prefix=/usr/local/sphinx
make
make test
make install UNINSTALL=1
```

Install Festival, and the 'kallpc8k' voice, sitable for telephone quality.

**Note:** *YAML is not required I just don't like to see it keep popping up in cpan that it;s not installed.*

```
yum install festival bison python-devel pcre-devel perl-CPAN

cpan
install yaml
install Astrisk::AGI
install Config::Tiny
install Proc::Daemon
install Log::Log4perl
quit

export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
```

Show Installed Perl Modules

```
perldoc perllocal

PERLLOCAL(1)          User Contributed Perl Documentation         PERLLOCAL(1)

   Fri Mar  4 01:19:46 2016: "Module" asterisk-perl
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 1.03"

       ·   "EXE_FILES: "

   Fri Mar  4 01:21:05 2016: "Module" DBI
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 1.634"

       ·   "EXE_FILES: dbiproxy dbiprof dbilogstrip"

   Mon Jul  3 01:24:03 2017: "Module" Config::Tiny
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 2.23"

       ·   "EXE_FILES: "

   Mon Jul  3 01:25:23 2017: "Module" Proc::Daemon
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 0.23"

       ·   "EXE_FILES: "

   Mon Jul  3 15:23:47 2017: "Module" Speech::Recognizer::SPX
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 0.0801"

       ·   "EXE_FILES: "

Mon Jul  3 21:08:51 2017: "Module" Log::Log4perl
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 1.49"

       ·   "EXE_FILES: eg/l4p-tmpl"

   Mon Jul  3 21:10:50 2017: "Module" Text::Diff
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 1.44"

       ·   "EXE_FILES: "

   Mon Jul  3 21:10:51 2017: "Module" Spiffy
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 0.46"

       ·   "EXE_FILES: "

   Mon Jul  3 21:10:56 2017: "Module" Test::Base
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 0.88"

       ·   "EXE_FILES: "

   Mon Jul  3 21:10:56 2017: "Module" Test::YAML
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 1.06"

       ·   "EXE_FILES: bin/test-yaml"

   Mon Jul  3 21:11:01 2017: "Module" YAML
       ·   "installed into: /usr/local/share/perl5"

       ·   "LINKTYPE: dynamic"

       ·   "VERSION: 1.23"

       ·   "EXE_FILES: "


perl v5.10.1                      2017-07-03                      PERLLOCAL(1)
```

### Install swig ###

```
wget "http://prdownloads.sourceforge.net/swig/swig-3.0.7.tar.gz"
tar -zxvf swig-3.0.7.tar.gz
cd swig-3.0.7
./configure
make
make install
```

### Install pocketsphinx ###

https://sourceforge.net/projects/cmusphinx/files/sphinxbase/5prealpha/

https://sourceforge.net/projects/cmusphinx/files/sphinx4/5prealpha/

https://sourceforge.net/projects/cmusphinx/files/sphinxtrain/5prealpha/

https://sourceforge.net/projects/cmusphinx/files/pocketsphinx/5prealpha/

```
cd /usr/local/src
wget -O sphinxbase-5prealpha.tar.gz https://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha/sphinxbase-5prealpha.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2Fsphinxbase%2F5prealpprealpha%2F&ts=1499058231&use_mirror=pilotfiber
wget -O pocketsphinx-5prealpha.tar.gz https://downloads.sourceforge.net/project/cmusphinx/pocketsphinx/5prealpha/pocketsphinx-5prealpha.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2Fpocketsphinx%2F5$
wget -O sphinxtrain-5prealpha.tar.gz https://downloads.sourceforge.net/project/cmusphinx/sphinxtrain/5prealpha/sphinxtrain-5prealpha.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2Fsphinxtrain%2F5pre$
wget -O sphinx4-5prealpha-src.zip https://downloads.sourceforge.net/project/cmusphinx/sphinx4/5prealpha/sphinx4-5prealpha-src.zip?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fcmusphinx%2Ffiles%2Fsphinx4%2F5prealpha%2F&ts=1499128591&use_mirror=pilotfiber
tar -zxvf pocketsphinx-5prealpha.tar.gz
tar -zxvf sphinxbase-5prealpha.tar.gz
mv sphinxbase-5prealpha sphinxbase
cd sphinxbase
.configure --enable-fixed --without-lapack
./configure --enable-fixed --without-lapack
make
make install
cd ..
cd pocketsphinx-5prealpha
cp -r ../sphinxbase .
./configure
make clean all
make check
make install
```

### Add /usr/local/sphinx/lib to ld.so.conf ###

```
nano /etc/ld.so.conf

include ld.so.conf.d/*.conf
/usr/local/sphinx/lib

ldconfig
```

### Part 8 ###

#### Fixing Aged Items ####

The first issue about the old version that the game used was it's using pipes "|" which were changed after Asterisk 1.6 to just commas "," so we have to fix this in 3 spots.

```
exten => 300,1,AGI(/usr/local/games/zoip-0.2.1/zoip.agi|ZORK1.DAT)
```

to

```
exten => 300,1,AGI(/usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT)
```

We add this to extensions_custom.conf.

```
nano /etc/asterisk/extensions_custom.conf under [from-internal-custom].

; This file contains example extensions_custom.conf entries.
; extensions_custom.conf should be used to include customizations
; to AMP's Asterisk dialplan.

; Extensions in AMP have access to the 'from-internal' context.
; The context 'from-internal-custom' is included in 'from-internal' by default

[from-internal-custom]
;# // BEGIN Reminders
exten => 123,1,Answer
exten => 123,2,Wait(1)
exten => 123,3,Authenticate(1337)
exten => 123,4,Goto(reminder,s,1)
;# // END Reminders

;# // BEGIN ZoIP
exten => 300,1,AGI(/usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT)
;# // END ZoIP
...

```

### Part 9 ###

Restart restart asterisk so it will reload extensions_custom.conf which will allow us to dial 300 on the phone to get to the zoip game server.

```
amportal restart
```

The next place we have to fix this issue is zoip.agi.

```
if( !$ARGV[0] ) {
	$AGI->verbose("No story file specified, exiting.", 1 );
	$AGI->verbose("Usage: exten => 100,1,AGI(zoip.agi|GAMEFILE.DAT)", 1);
	print STDERR "No story file specified, exiting.\n";
	print STDERR "Usage: exten => 100,1,AGI(zoip.agi|GAMEFILE.DAT)\n";
	exit(-1);
}
```

to

```
if( !$ARGV[0] ) {
        $AGI->verbose("No story file specified, exiting.", 1 );
        $AGI->verbose("Usage: exten => 100,1,AGI(zoip.agi,GAMEFILE.DAT)", 1);
        print STDERR "No story file specified, exiting.\n";
        print STDERR "Usage: exten => 100,1,AGI(zoip.agi,GAMEFILE.DAT)\n";
        exit(-1);
}
```


```
nano /usr/local/games/zoip/zoip.agi
#!/usr/bin/perl

# ZoIP
#
# Written by Simon P. Ditner <simon@uc.org> as a platform to experiment with
# IVR, text-to-speech, and speech-to-text software
#
# Major components used:
#  ZIO_Asterisk, a Games::Rezrov::ZIO compatible module, giving us access to a $
#  Asterisk::AGI, allows us to send commands to asterisk
#

our $VERSION = '0.2.1';

use FindBin;
use lib "$FindBin::Bin/lib";

use Asterisk::Games::Zork::StoryFile;      # Ever so slightly customized versio$
use Asterisk::Games::Zork::ZInterpreter;  # to make them compatible with Asteri$
use Games::Rezrov::ZOptions;
use Games::Rezrov::ZConst;
use Asterisk::AGI;

use Asterisk::Games::Zork::ZIO_Asterisk; # This is where all the callback routi$
                                         # by the ZInterpreter
use Config::Tiny;

my $AGI = new Asterisk::AGI;
my %input = $AGI->ReadParse();   # Parse data structure passed in from Asterisk
$AGI->setcallback(\&cleanup); # Cleanup that should be performed if the caller $

if( !$ARGV[0] ) {
        $AGI->verbose("No story file specified, exiting.", 1 );
        $AGI->verbose("Usage: exten => 100,1,AGI(zoip.agi,GAMEFILE.DAT)", 1);
        print STDERR "No story file specified, exiting.\n";
        print STDERR "Usage: exten => 100,1,AGI(zoip.agi,GAMEFILE.DAT)\n";
        exit(-1);
}

my $config = Config::Tiny->read( $FindBin::Bin . '/etc/zoip.conf' );
$config->{zoip}->{path} = $FindBin::Bin;

my $story_file = undef;
my @searchpath = ( $FindBin::Bin . "/share/games", "" );
foreach $path( @searchpath ) {
        if ( -f "$path/$ARGV[0]" ) {
                $story_file = "$path/$ARGV[0]";
        }
}
if( !defined($story_file) ) {
   $AGI->verbose("Couldn't find story file $ARGV[0]", 1);
   print STDERR "Couldn't find story file $ARGV[0]\n";
   exit(-1);
}

my $zio = new Asterisk::Games::Zork::ZIO_Asterisk( "columns" => 800, "rows" => $
my $story = new Games::Rezrov::StoryFile($story_file, $zio);
Games::Rezrov::StoryFile::setup();
my $zi = new Games::Rezrov::ZInterpreter($zio);

sub cleanup {
   $AGI->hangup();
   exit(0);
}
```

And the next place is in ZIO_Asterisk.pm

```
$self->{AGI}->exec("monitor", "wav|$recording");
# $self->{AGI}->exec("record", "$recording.wav|1|10|q" );
```

to

```
$self->{AGI}->exec("monitor", "wav,$recording");
# $self->{AGI}->exec("record", "$recording.wav,1,10,q" );
```

**Note:** *The last line doesn't have to change as it's commented out but who knows what the future brings.*

Now make astrisk the owner.

```
chown -R asterisk:asterisk /usr/local/games
```

### Part 7 ###

Find some z-machine games to play! 

Various games can be found around the net, simply search for 'interactive fiction', 'infocom', 'zork' and such things. The only part you will need is the .DAT file. Move them into the share/games folder in the zoip directory.

Find a ZORK1.DAT file on the internet and copy it to this directory below.

```
cp ~/Downloads/ZORK1.DAT /usr/local/games/zoip/share/games/
```

### Part DEBUGGING ###

Test the script

```
/usr/local/games/zoip-0.2.1/zoip.agi ZORK1.DAT
```

Push enter a bunch of times and number keys, you should see some game script...

```
VERBOSE "Zasterisk: -->West of House<--" 1
1
VERBOSE "Zasterisk: Playing cached file" 3
2
STREAM FILE /tmp/tts-4c13ad036f18f1b89490f1c6695173a0 #
3
VERBOSE "Zasterisk: -->You are standing in an open field west of a white house, with a boarded front door.<--" 1
4
VERBOSE "Zasterisk: Playing cached file" 3
5
STREAM FILE /tmp/tts-cbb9348ec36370d73425191b52bc7839 #
6
VERBOSE "Zasterisk: -->There is a small mailbox here.<--" 1
```

### Part 6 ###

```
yum install tmux
```

Start a tmux session so it will keep going in the background if we lose console connection.

```
tmux new -s zorkserver
/usr/local/games/zoip/sphinx_server.pl
```

A bunch of text should start flowing by from the zoip game server.

Detach from the tmux session (It will keep running the zoip game server in the background).

```
The formatting here is simple enough to understand (I would hope). ^ means ctrl+, so ^x is ctrl+x. M- means meta (generally left-alt or escape)+, so M-x is left-alt+x

^b d OR
^b :detach
```

If you need to re-attach later type (Don't do it now...):

```
tmux a -t zorkserver
```

### Part 10 ###

Now watch the asterisk CLI for issues or success.

```
asterisk -rvvvvvvvvv
```

As you watch the asterisk console dial 300 on one of your phone sets. You should be greeted by ZORK "You are standing in an open field west of a white house, with a boarded front door..." Good luck, don't get eaten by a grue.

```
 -- Launched AGI Script /usr/local/games/zoip-0.2.1/zoip.agi
 /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: -->West of House<--
    -- /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: Playing cached file
    -- <PJSIP/701-00000003> Playing '/tmp/tts-4c13ad036f18f1b89490f1c6695173a0.slin' (escape_digits=#) (sample_offset 0) (language 'en')
 /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: -->You are standing in an open field west of a white house, with a boarded front door.<--
    -- /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: Playing cached file
    -- <PJSIP/701-00000003> Playing '/tmp/tts-cbb9348ec36370d73425191b52bc7839.slin' (escape_digits=#) (sample_offset 0) (language 'en')
 /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: -->There is a small mailbox here.<--
    -- /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: Playing cached file
    -- <PJSIP/701-00000003> Playing '/tmp/tts-e4f43f74dcfe3941013064fe5b1de8df.slin' (escape_digits=#) (sample_offset 0) (language 'en')
    -- <PJSIP/701-00000003> Playing 'beep.gsm' (escape_digits=) (sample_offset 0) (language 'en')
    -- AGI Script Executing Application: (monitor) Options: (wav,/tmp/recording--1499121444.28)
    -- AGI Script Executing Application: (backgrounddetect) Options: (/usr/local/games/zoip-0.2.1/share/sounds/silence/10)
       > 0xa0957a8 -- Probation passed - setting RTP source address to 10.10.10.53:2242
    -- <PJSIP/701-00000003> Playing '/usr/local/games/zoip-0.2.1/share/sounds/silence/10.gsm' (language 'en')
    -- AGI Script Executing Application: (stopmonitor) Options: ()
 /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: Sphinx returned: []
 /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: -->tick tock<--
    -- /usr/local/games/zoip-0.2.1/zoip.agi,ZORK1.DAT: Zasterisk: Playing cached file
    -- <PJSIP/701-00000003> Playing '/tmp/tts-a7d114f146239027feb6b366453eeee4.slin' (escape_digits=#) (sample_offset 0) (language 'en')
    -- <PJSIP/701-00000003> Playing 'beep.gsm' (escape_digits=) (sample_offset 0) (language 'en')
    -- AGI Script Executing Application: (monitor) Options: (wav,/tmp/recording--1499121444.28)
    -- AGI Script Executing Application: (backgrounddetect) Options: (/usr/local/games/zoip-0.2.1/share/sounds/silence/10)
    -- <PJSIP/701-00000003> Playing '/usr/local/games/zoip-0.2.1/share/sounds/silence/10.gsm' (language 'en')
 ```
 
**Note:** *I heard nothing for a while then it said tick-tock BEEEEP. Just try saying something and see if the game carries on, like "GO North".*

**Note:** *Sphinx is not amazing at detecting my voice, I said "Go North" and it said "Kill North" When I waited a bit and said "run north" then it mistook that as just "North" and proceeded.*

w00t success, Blast from the past!

**Note:** *I did not fully test this. There may be other hickups. I just wanted to see it basically working (which it is).*
