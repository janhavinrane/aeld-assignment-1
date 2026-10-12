#!/bin/bash

# This script searches for a given string in the specified directory
# Usage: ./finder.sh <filesdir> <searchstr>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: Directory $filesdir does not exist."
    exit 1
fi

# Prints a message "The number of files are X and the number of matching lines 
#are Y" where X is the number of files in the directory and all subdirectories 
#and Y is the number of matching lines found in respective files, 
#where a matching line refers to a line which contains searchstr 
#(and may also contain additional content).

num_files=$(find "$filesdir" -type f 2>/dev/null | wc -l )
num_matching_lines=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

exit 0