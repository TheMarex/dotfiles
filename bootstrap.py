#!/usr/bin/python2

import os
import os.path as path
import socket
hostname = socket.gethostname()

home = os.path.expanduser("~/")
dotfiles = os.path.expanduser("~/.dotfiles")

base_dirs = [".", ".config/", ".local/bin/"]
ignore = [".git", ".gitmodules", "bootstrap.py"]

for d in base_dirs:
    print "> Entering " + d
    p = path.join(dotfiles, d)
    files = os.listdir(p)
    for f in files:
        if f in ignore or f in base_dirs:
            print " - Ignoring " + f
            continue
        print " <> Linking %s to %s" % (path.join(p, f), path.join(home, d, f))
        try:
            os.symlink(path.join(p, f), path.join(home, d, f))
        except OSError:
            print " >> Could not link."

custom_config_path = path.join(dotfiles, ".config", "custom")
files = os.listdir(custom_config_path)
for f in files:
    if not f.startswith(hostname):
        continue
    realname = f.replace(hostname + "-", "")
    src = path.join(custom_config_path, f)
    target = path.join(home, ".config", "custom", realname)
    print " <> Linking %s to %s" % (src, target)
    try:
        os.symlink(src, target)
    except OSError:
        print " >> Could not link."
