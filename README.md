# Bash Script Race Condition Bug

This repository demonstrates a race condition bug in a bash script.

## Description

The `bug.sh` script creates two files and then starts two processes that concurrently write to these files.  Due to the non-atomic nature of file I/O operations, a race condition can occur, leading to unpredictable output where data might be partially written or overwritten.

## Solution

The `bugSolution.sh` script addresses this race condition by using file locking mechanisms, ensuring that only one process can write to the file at a time. This prevents data corruption and guarantees consistent results.