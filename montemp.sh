#!/bin/bash
# 18jul2023 - Ken w4noc. Monitors pi temp, cpu clock 50 times or  until you stop it.
# Free to use without warranty or liability.
echo "W4NOC script using vcgencmd commands to monitor Pi operating conditions."
echo "Displays current operating conditions, then logs cpu frequency and"
echo "temperature to screen 50 times, once every 5 seconds."
echo "Press [ctrl+c] to stop early"
echo ""
echo "Current conditions"
vcgencmd measure_clock arm
vcgencmd get_throttled
vcgencmd measure_volts
vcgencmd get_mem arm
vcgencmd get_mem gpu
echo ""
echo "Next, measure CPU frequency and temperature 50 times."
for count in $(seq 1 50); do
  vcgencmd measure_clock arm
  sleep 5s
echo ""
  vcgencmd measure_temp
  sleep 5s
echo ""
done
echo "I'm done!"
