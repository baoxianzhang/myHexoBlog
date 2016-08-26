#!/bin/sh
hexo generate
cp -R public/* .deploy/baoxianzhang.github.io
cd .deploy/baoxianzhang.github.io
git add .
git commit --amend --no-edit
git push -f
