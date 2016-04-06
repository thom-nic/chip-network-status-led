# Network Status LED

You can look at a CHIP sitting on your desk/closet/whatever but have no idea
if it's connected to the network.  This is a simple script to blink the
secondary LED to indicate network status.

Under default settings, the script runs as a daemon and blinks the LED 3 times
in quick succession if the network is unreachable.

If the network is OK, you will see a very short 'blip' on the LED every 5s to
indicate the script is still alive.

This could be modified to run once and exit so it could be scheduled as a
cron job.  However you'd have to watch the LED for up to 1m to wait for it
to run.  Instead there's an install script and systemd unit file. See
[install.sh](install.sh).
