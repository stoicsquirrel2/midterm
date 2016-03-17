#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: bash $0 filename.gff output.txt"
    exit 1
fi

filename=$1
output=$2

cat "$filename" | sed -e '/##FASTA/,$d' | grep -v '^#' > "$output"
