#!/usr/bin/env python2

import os
import sys

os.environ.setdefault('DNS_RESOLVER', '1.1.1.1')
os.environ.setdefault('S3_DOMAIN', 's3.amazonaws.com')

with open('default.conf') as f:
    sys.stdout.write(os.path.expandvars(f.read()))
