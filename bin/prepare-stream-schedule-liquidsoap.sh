#!/bin/sh

pkill -9 -f "/etc/stream-schedule/liquidsoap/start.conf"

[ -d /var/run/stream-schedule ] || mkdir /var/run/stream-schedule
chmod 775 /var/run/stream-schedule
chown audiostream /var/run/stream-schedule

[ -f /var/run/stream-schedule/stream-schedule-liquidsoap.pid ] && rm /var/run/stream-schedule/stream-schedule-liquidsoap.pid

[ -d /var/log/stream-schedule/ ] || mkdir /var/log/stream-schedule/
chmod 755 /var/log/stream-schedule
chown audiostream:www-data /var/log/stream-schedule/
[ -f /var/log/stream-schedule/liquidsoap.log ] && chmod 664 /var/log/stream-schedule/liquidsoap.log
[ -f /var/log/stream-schedule/liquidsoap.log ] && chown audiostream:www-data /var/log/stream-schedule/liquidsoap.log

#    su -s /bin/sh -c 'exec "$0" "$@" >>/var/log/stream-schedule/liquidsoap.log 2>&1' audiostream -- liquidsoap /etc/stream-schedule/liquidsoap/start.conf
#    sleep 3
#done
exit 0
