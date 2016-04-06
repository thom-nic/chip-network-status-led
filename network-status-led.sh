#!/usr/bin/env bash
#
# Usage: $ ./led_status.sh [host to ping]
# If host is not reachable this will flash the CHIP's LED4 times.
# Under normal operation, there is a very fast 'heartbeat' blip on the LED
# once every 5s so you can tell the script is running.
#
# Author: Thom Nichols
#

HOST=${1:-"google.com"}
TEST_COMMAND="ping -c1 $HOST"

CHECK_FREQUENCY=60
HEARTBEAT_FREQUENCY=5

FAST_BLINK_DELAY=.2
BLINK_COUNT=9

# Note: blink always starts OFF, if you want it to end in the ON state,
# make count an even number.  OFF: make count an odd number
function fast_blink {
  count=${1:-9}  # 4 blinks then turn back off
  led_state=0
  delay=${2:-".2"}
  while [[ $count > 0 ]]; do
    set_led $led_state
    [[ $led_state == 0 ]] && led_state=1 || led_state=0
    count=$((count-1))
    sleep $delay
  done
}

function blip {
 fast_blink 3 .01
}

function set_led {
  /usr/sbin/i2cset -f -y 0 0x34 0x93 0x$1
}

function heartbeat_until {
  while [[ $(now) < $1 ]]; do
    blip
    sleep ${2:-5}
  done
}

function now {
  date +%s
}

while true; do
  delay=$CHECK_FREQUENCY
  if ! $TEST_COMMAND ; then
    echo "Network appears DOWN!"
    fast_blink $BLINK_COUNT $FAST_BLINK_DELAY
    delay=5
  else
    echo "Network OK"
  fi
  t=$(now)
  heartbeat_until $((t + $delay)) $HEARTBEAT_FREQUENCY
done
