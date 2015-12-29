#!/usr/bin/env bash

mkdir -p $2
rsync -av --delete \
        --exclude='.git' \
        --exclude='.vagrant' \
        --exclude='/vendor' \
        --exclude='/packer_cache' \
        --exclude='/cookbooks' \
        --exclude='/Gemfile.lock' \
        --exclude='.idea' \
        $1 $2 || exit $?
