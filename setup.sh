rm -f /app/temp/etc/tor/torrc_$PORT
echo "HiddenServiceDir /app/temp/var/lib/tor/hidden_service" >> /app/temp/etc/tor/torrc_$PORT
echo "HiddenServicePort 80 127.0.0.1:$PORT" >> /app/temp/etc/tor/torrc_$PORT
tor -f /app/temp/etc/tor/torrc_$PORT
