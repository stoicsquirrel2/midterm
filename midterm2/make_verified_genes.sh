#!/bin/bash

if [ $# -eq 0 ]; then                                   #error check
    echo "Usage: bash $0 filename.gff output.txt"
    exit 1
fi

filename=$1
output=$2

# NOTE: this is all one big awk statement
cat "$filename" |               #reads file
  awk -v OFS='\t' '$3 == "gene" && match($9,  /orf_classification=Verified$/) {  #finds genes whose ORF is verified
    split($9, array, ";");                                                      #splits column 9 by ; into array
    for(key in array) {
      if(match(array[key], /^Name=/)) {             #finds name  and
    	name = substr(array[key], 15)                 #sets gene name to variable name
      }
    };
    print(name, $1, $4, $5, $7);              #outputs name, chromosome, start, end and strand
  }' > "$output"
