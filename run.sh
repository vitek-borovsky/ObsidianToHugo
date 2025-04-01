#!/usr/bin/env sh
##### !!!!!!!!!!!!!!! ####
# VERY IMPORTANT AS THIS CONTAINS rm -rf Out/*
cd $(dirname $0)
set -eu
set -x

docker build -t obsidian2hugo:latest .

docker run \
    --rm \
    -it \
    -v ./hugo/content:/app/content \
    obsidian2hugo:latest

# docker run hugomods/hugo:base \
docker run \
    --rm \
    -it \
    -v ./hugo:/src \
    -v /var/hugo_cache:/tmp/hugo_cache \
    hugomods/hugo:latest \
    build
