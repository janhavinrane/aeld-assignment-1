#!/bin/bash

# This script writes a given string to a specified file
# Usage: ./writer.sh <writefile> <writestr>

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

#Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print statement if the file could not be created.

mkdir -p "$(dirname "$writefile")" 2>/dev/null
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not create file $writefile."
    exit 1
fi

exit 0