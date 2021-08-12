#!/usr/bin/env python3
import linecache
fobj = linecache.getline("wgcf-account.toml", 3)
data = fobj.strip()
devid = data[15:-1]
print(devid)
