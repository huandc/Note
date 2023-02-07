#!/bin/bash

git stash save backup

git pull -r

git stash pop

git add .

time=$(date "+%Y%m%d-%H%M%S")
echo "${time}"
git commit -m "${time} auto update note repo"

git push