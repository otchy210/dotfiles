#!/usr/bin/env python3

import os
import subprocess

cwd = os.getcwd()
files = os.listdir('.')
for file in files:
    path = cwd + '/' + file
    print(path)
    if not os.path.isfile(path):
        continue
    updatedDirPath = cwd + '/updated'
    if not os.path.isdir(updatedDirPath):
        os.mkdir(updatedDirPath)
    updatedPath = cwd + '/updated/' + file[:file.rfind('.')] + '.mp4'
    print(subprocess.call('ffmpeg -i "' + path + '"  -vf bwdif=0:-1:1 -c:v libx264 "' + updatedPath + '"', shell=True))
