#!/bin/sh -l
set -e

git config --global user.email  $GITHUB_USERNAME
git config --global user.name $GITHUB_USER_EMAIL
git clone https://Sridhar9494:$4@github.com/$5.git  $RUNNER_TEMP/infra-as-code-repo
wget https://raw.githubusercontent.com/Sridhar9494/gitops/replace-key.py
python replace-key.py --file $RUNNER_TEMP/infra-as-code-repo/deployment.apps/$1 --key $2 --value $3
cd $RUNNER_TEMP/infra-as-code-repo
git add .
git commit -m "Release of key $2 in $1"
git push
