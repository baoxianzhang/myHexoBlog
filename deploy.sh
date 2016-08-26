#!/bin/sh
hexo generate
cp -R public/* .deploy/baoxianzhang.github.io
cd .deploy/baoxianzhang.github.io
git add .
git commit -m “update”
git push origin master

