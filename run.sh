#!/bin/sh -e

src=/app/default.conf
target=/etc/nginx/conf.d/default.conf

if [ "$S3_BUCKET" == "" ]; then
  echo "S3_BUCKET is required"
  exit 1
fi
sed "s/\${S3_BUCKET}/${S3_BUCKET}/g" $src > $target

nginx -g "daemon off;"
