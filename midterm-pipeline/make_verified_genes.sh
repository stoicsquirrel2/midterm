#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: bash $0 filename.gff output.txt"
    exit 1
fi

filename=$1
output=$2

# NOTE: this is all one big awk statement
cat "$filename" |
  awk -v OFS='\t' '$3 == "gene" && match($9,  /orf_classification=Verified$/) { 
    split($9, array, ";");
    for(key in array) {
      if(match(array[key], /^Ontology_term=/)) {
    	go = substr(array[key], 15)
      }
    };
    print($1, $4, $5, $7, go);
  }' > "$output"
