#!/bin/bash
source /etc/profile

git pull -r

git add .

time=$(date "+%Y/%m/%d-%H:%M:%S")

git commit -m "${time} auto update note repo"

git push
