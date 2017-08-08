#!/bin/sh -e

target=${1:-/etc/nginx/conf.d/default.conf}

if [ "$S3_BUCKET" == "" ]; then
  echo "S3_BUCKET is required"
  exit 1
fi

if [ "$S3_DIR" == "" ]; then
  export S3_DIR=""
  export SEPARATOR=""
else
  export SEPARATOR="/"
fi

./envsubst.py default.conf > $target
cat $target

nginx -g "daemon off;"
