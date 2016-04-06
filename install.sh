# This should be run as root.
install network-status-led.sh /usr/local/bin/
# Note that /usr/lib/systemd/system doesn't exist by default in the chip distro..
install -m 755 -d /usr/lib/systemd/system/
install -m 644 network-status-led.service /usr/lib/systemd/system/
systemctl daemon-reload
systemctl enable network-status-led
systemctl start network-status-led
