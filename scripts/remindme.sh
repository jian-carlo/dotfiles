#!/usr/bin/env bash

FILE="$HOME/.local/share/todo/reminder.txt"

case "$1" in
    "-e" ) nvim $FILE ;;
    "" ) cat $FILE
esac
