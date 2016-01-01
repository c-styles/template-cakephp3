#!/usr/bin/env bash

(
  cd $1 || exit $?
  /usr/bin/php composer.phar install || exit $?
  bin/cake plugin assets symlink || exit $?
)
