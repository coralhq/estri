#!/usr/bin/env python2

import os
import sys

with open('default.conf') as f:
    sys.stdout.write(os.path.expandvars(f.read()))
