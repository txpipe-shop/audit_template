#!/bin/bash

# loop through all the files in the directory:
for file in src/*.typ
do
    # run the compiler
    typst compile --format=pdf "$file"
done
