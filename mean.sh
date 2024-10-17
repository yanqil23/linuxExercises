#!/bin/bash

if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "usage: $0 <column> [file.csv]" 1>&2
    exit 1
fi

col=$1

if [ -z "$2" ]; then
    input="/dev/stdin"
else
    input="$2"
fi

cut -d, -f"$col" "$input" | tail -n +2 | {
    sum=0
    count=0
    while read -r value; do
        sum=$(echo "$sum + $value" | bc)
        count=$((count + 1))
    done
    if [ "$count" -gt 0 ]; then
        mean=$(echo "scale=2; $sum / $count" | bc)
        echo "$mean"
    else
        echo "No data to process" >&2
        exit 1
    fi
}

