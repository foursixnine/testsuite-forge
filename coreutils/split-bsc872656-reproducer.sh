#!/bin/sh
set -e
{ printf '%131070s\n' ''; printf 'x\n'; printf '%131071s\n' ''; } > in
split -C 131072 ---io=131072 in
echo "No crash so far"
