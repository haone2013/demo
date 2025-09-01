#!/bin/bash


if [ $# -lt 1 ]; then
  echo "Usage: $0 [url target]"
  exit 1
fi


OUT="attack_program"


gcc attack.c -o "$OUT" -lssl -lcrypto -lnghttp2 -lpthread >/dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "❌ Compile failed!"
  exit 1
fi


./"$OUT" "$1"
