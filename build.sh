#!/bin/bash

echo "Building..."
# Get repo URL
REPOSITORY=`git remote -v | grep fetch | tail -1 | \
		sed "s|.*\(github.com\):|https://\1/|g" | \
		sed "s/\(.git\)\? (.*//g" | \
		sed "s|.*\(https://github.com/\)|\1|g" | \
		sed "s|.*\(https://github.com/\)|\1|g"`

echo "Repository set to '$REPOSITORY'"

# loop through all the files in the directory:
for file in src/*.typ
do
    # run the compiler
    typst compile --format=pdf "$file" --font-path src/fonts --input "repository=$REPOSITORY"
done

echo "... Done!"
