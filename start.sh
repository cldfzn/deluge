#! /bin/sh

rm -f /config/deluged.pid

deluged -c /config -L debug -l /config/deluged.log
deluge-web -c /config
