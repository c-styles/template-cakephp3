#!/usr/bin/env bash

(
  cd $1 || exit $?
  chef-client -z -c ./.chef/client.rb -j $2  || exit $?
)
