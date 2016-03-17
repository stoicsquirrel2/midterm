#!/bin/bash

if [ $# -eq 0 ]; then                                   #check that file has been passed into script
    echo "Usage: bash $0 filename.gff output.txt output2.txt"
    exit 1
fi

filename=$1 #assigns variable name to input and output files
output=$2
output2=$3

cat "$filename" | sed -e '/##FASTA/,$d' | grep -v '^#' > "$output" #filters text and removes FASTA info and only prints lines that do not have # at beginning
cat "$filename" | awk '/##FASTA/{y=1;next}y' > "$output2" #create fasta file


