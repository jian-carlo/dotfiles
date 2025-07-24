#!/usr/bin/env bash

while true; do
  echo -n "calc> "
  read expr

  awk "BEGIN { print $expr }"
done
