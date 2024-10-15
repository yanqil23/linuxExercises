#!/bin/bash
# usage statement
usage() {
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
}
dir="$1"

n="$2"

find "$dir" -type f -size +"$n"c -exec rm -f {} \;

echo "Removed files larger than $n bytes in directory $dir."
