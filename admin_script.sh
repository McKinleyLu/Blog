#!/usr/bin/env sh
git remote add esc git@github.com:McKinleyLu/Blog.git
git pull esc esc
git rm -r --cached .
git checkout esc
git add .
git commit -m "ubunte"
git push  origin   esc:esc
hexo clean
hexo g  -d
