#!/bin/bash

if [ $# -eq 0 ]; then                                   #check that file has been passed into script
    echo "Usage: bash $0 filename.gff output.txt"
    exit 1
fi

filename=$1 #assigns variable name to input and output files
output=$2

cat "$filename" | sed -e '/##FASTA/,$d' | grep -v '^#' > "$output" #filters text and removes FASTA info and only prints lines that do not have # at beginning
