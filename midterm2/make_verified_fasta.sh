#!/bin/bash

if [ $# -eq 0 ]; then                                   #error check
    echo "Usage: bash $0 filename.gff output.txt"
    exit 1
fi

filename=$1
filename=$2
output=$3

bedtools getfasta -fi "$filename" -bed "$filename2" -fo "$output" -name

