# This should be run as root.
install network-status-led.sh /usr/local/bin/
install -m 644 network-status-led.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable network-status-led
