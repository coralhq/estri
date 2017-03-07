#!/bin/sh -e

src=/app/default.conf
target=/etc/nginx/conf.d/default.conf

if [ "$S3_BUCKET" == "" ]; then
  echo "S3_BUCKET is required"
  exit 1
fi

if [ "$S3_DIR" != "" ]; then
  S3_DIR="\/${S3_DIR}"
fi

sed "s/\${S3_BUCKET}/${S3_BUCKET}/g; s/\${S3_DIR}/${S3_DIR}/g; s/\${S3_DIR}/${S3_DIR}/g" $src > $target

cat $target
nginx -g "daemon off;"
