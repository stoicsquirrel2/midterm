#!/bin/bash

if [ $# -eq 0 ]; then                               #error check 
    echo "Usage: bash $0 filename.gff output.txt"
    exit 1
fi

filename=$1
output=$2

cat "$filename" | awk '$3 == "chromosome"' | cut -f 1,4,5 > "$output" #prints the chromosome start and end nucleotides
