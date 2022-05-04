#!/bin/sh

if diff ./test/expected ./test/result >/dev/null ; then
  printf "\e[32mALL TESTS PASS\n\e[0m"
else
  printf "\e[32mSOME TEST FAILED\n\e[0m"
fi