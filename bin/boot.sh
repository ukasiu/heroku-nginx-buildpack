# ---------------------------------------------------------------------
# Copyright 2013-2014 Jordon Bedwell.
# Apache 2.0 License.
# ---------------------------------------------------------------------

conf_file=/app/nginx/conf/nginx.conf
if [ -f /app/public/nginx.conf ]
then
  conf_file=/app/public/nginx.conf
fi

mv $conf_file /app/nginx/conf/orig.conf
erb /app/nginx/conf/orig.conf > /app/nginx/conf/nginx.conf

# ---------------------------------------------------------------------

(tail -f -n 0 /app/nginx/logs/*.log &)
exec /app/nginx/sbin/nginx -p /app/nginx -c /app/nginx/conf/nginx.conf

# ---------------------------------------------------------------------
