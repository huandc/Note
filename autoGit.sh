#!/bin/bash
source /etc/profile

git stash save backup

git pull -r

git stash pop

git add .

time=$(date "+%Y/%m/%d-%H:%M:%S")

git commit -m "${time} auto update note repo"

git push
