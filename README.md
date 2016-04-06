# Network Status LED

*Hello!  Are you there?*

If you look at a CHIP sitting on your desk/closet/whatever you probably have no
idea if it's connected to the network.  This is a simple script to blink the
secondary LED to indicate network status.  It also does a great job as a
general-purpose visual heartbeat, so you know the OS/ userspace is still alive!

Under default settings, the script runs as a daemon and blinks the LED 3 times
in quick succession if the network is unreachable.  If the network is OK, you
will see a very short 'blip' on the LED every 5s to indicate the daemon is
still alive and connection is good!


## Demo

[![Watch the demo video!](https://img.youtube.com/vi/4JxTMmnWs24/0.jpg)](https://youtu.be/4JxTMmnWs24)


## Installation

The script has exactly two dependencies: `bash` and `ping`.  It might work
in `zsh` as well and probably with `dash`/ busybox `sh`.

Customize the `$TEST_COMMAND` variable if you want to use another method
to test network status instead of `ping`.

This could be modified to run once and exit so it could be scheduled as a
cron job.  However you'd have to watch the LED for up to 1m to wait for it
to run.  Instead there's an install script and systemd unit file.  See
[install.sh](install.sh).  Once installed it will run on startup.  The script
itself does not of course rely on systemd, you could instead invoke it in
sysV init or upstart as well.  The main CHIP distro just happens to use
systemd.

