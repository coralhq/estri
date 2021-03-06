# ESTRI

[![Docker Automated build](https://img.shields.io/docker/automated/coralteam/estri.svg?style=flat-square)](https://hub.docker.com/r/coralteam/estri/) [![Docker Build Status](https://img.shields.io/docker/build/coralteam/estri.svg?style=flat-square)](https://hub.docker.com/r/coralteam/estri/) [![Docker Pulls](https://img.shields.io/docker/pulls/coralteam/estri.svg?style=flat-square)](https://hub.docker.com/r/coralteam/estri/)

Simple nginx container that serves static files from public Amazon S3.

### Notes

- Currently only supports S3 buckets with public policy (see below)
- SSL termination is meant to be handled by our Rancher instance (Docker orchestration)

### How to use

1 - Create an S3 bucket with public policy:

```json
{
  "Version": "2014-06-14",
  "Statement": [
    {
      "Sid": "AllowPublicRead",
      "Effect": "Allow",
      "Principal": {
      "AWS": "*"
    },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::BUCKET_NAME_HERE/*"
    }
  ]
}
```

2 - Run Estri with proper env var

```sh
docker run -d \
  --name estri \
  -p 8080:8080 \
  -e S3_BUCKET=BUCKET_NAME_HERE \  # required
  -e S3_DIR=BUCKET_DIR_HERE \  # optional
  -e S3_DOMAIN=sgp1.digitaloceanspaces.com \  # optional, default: s3.amazonaws.com
  -e DNS_RESOLVER=8.8.8.8 \  # optional, default: 1.1.1.1
  coralteam/estri:latest
```

3 - Do not forget to replace `BUCKET_NAME_HERE` with your bucket name
