#!/bin/bash

# Avoid errors on the server such as:
#  - Error: virtual memory exhausted: Cannot allocate memory
#  - Error: Exit code 137
# due to many parallel jobs consuming all available memory
JOBS=$((CPU_COUNT*2 - 1))

echo "Using $JOBS parallel jobs out of $((CPU_COUNT*2)) available to build phreeqc4rkt."

# Configure the build of phreeqc4rkt
cmake -S . -B build ${CMAKE_ARGS} \
    -DCMAKE_BUILD_TYPE=Release

# Build and install phreeqc4rkt in $PREFIX
cmake --build build --target install --parallel $JOBS