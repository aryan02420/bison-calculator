#!/bin/sh

if diff ./test/expected ./test/result >/dev/null ; then
  printf "\x1b[92mALL TESTS PASS\x1b[0m"
else
  printf "\x1b[91mSOME TEST FAILED\x1b[0m"
fi