#!/bin/sh -l
set -e

git config --global user.email  $GITHUB_USERNAME
git config --global user.name $GITHUB_USER_EMAIL
git clone https://Sridhar9494:$GITHUB_TOKEN@github.com/Fair-Play-Club/Fantasy-ENV.git  $RUNNER_TEMP/Fantasy-ENV
wget https://raw.githubusercontent.com/Sridhar9494/gitops/master/replace-key.py
python replace-key.py --file $RUNNER_TEMP/Fantasy-ENV/$1 --key $2 --value $3
cd $RUNNER_TEMP/Fantasy-ENV
git add .
git commit -m"Release of key $2 in $1"
git push
