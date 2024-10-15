#!/bin/bash

# Check if a column number is provided
if [ -z "$1" ]; then
    echo "Usage: ./mean.sh <column> [file.csv]" >&2
    exit 1
fi

# Column number
col=$1

# Read the file from stdin or the specified file
if [ -z "$2" ]; then
    input="/dev/stdin"
else
    input="$2"
fi

# Check if the file or stdin exists and is readable
if [ ! -r "$input" ]; then
    echo "Error: Cannot read file or input" >&2
    exit 1
fi

# Extract the specified column and calculate the mean, skipping the header
awk -v col="$col" -F, 'NR > 1 {sum += $col; count++} END {if (count > 0) print sum / count}' "$input"
