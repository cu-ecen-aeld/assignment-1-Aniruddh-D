#!/bin/sh
# Writer script for assignment 1
# Author: Aniruddh-D

# Check if correct number of arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <writefile> <writestr>"
    echo "  writefile: full path to a file (including filename) on the filesystem"
    echo "  writestr: text string to be written to the file"
    exit 1
fi

writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
writedir=$(dirname "$writefile")
if [ ! -d "$writedir" ]; then
    mkdir -p "$writedir"
    if [ $? -ne 0 ]; then
        echo "Error: Could not create directory $writedir"
        exit 1
    fi
fi

# Write the content to the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create file $writefile"
    exit 1
fi
