#!/bin/bash

mkdir -p five

for dir_num in {1..5}; do
    mkdir -p five/dir$dir_num

    for file_num in {1..4}; do
        seq -s '\n' $file_num > five/dir$dir_num/file$file_num
    done
done

