#!/usr/bin/env sh
hexo clean
hexo g  -d
git pull esc esc  
git rm -r --cached .
git checkout esc
git add .
git commit -m "esc:2.0"
git push  origin   esc:esc
