#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to file with locking
write_to_file() {
  local file=$1
  local content=$2
  # Acquire an exclusive lock on the file
flock "$file" || exit 1
  echo "$content" > "$file"
  # Release the lock
flock -u "$file"
}

# Write to file1 using function
write_to_file file1.txt "Process 1 writing to file1.txt"

# Write to file2 using function
write_to_file file2.txt "Process 2 writing to file2.txt"

# Check the content of the files (should be complete and consistent)
cat file1.txt
cat file2.txt