#!/usr/bin/python

import os
import os.path as path

home = os.path.expanduser("~/")
dotfiles = os.path.expanduser("~/.dotfiles")

base_dirs = [".", ".config/"]
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
