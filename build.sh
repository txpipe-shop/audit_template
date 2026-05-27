#!/bin/bash

echo "Building..."

REPOSITORY=`git remote -v | grep fetch | tail -1 | \
		sed "s|.*\(github.com\):|https://\1/|g" | \
		sed "s/\(.git\)\? (.*//g" | \
		sed "s|.*\(https://github.com/\)|\1|g" | \
		sed "s|.*\(https://github.com/\)|\1|g"`

CLIENT=$(grep -oP 'client:\s*"\K[^"]*' src/audit.typ | head -1)
TITLE=$(grep -oP 'title:\s*"\K[^"]*' src/audit.typ | head -1)
OUTPUT=$(echo "${CLIENT}_${TITLE}" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"_audit.pdf"

echo "Repository set to '$REPOSITORY'"
echo "Client: $CLIENT"
echo "Title: $TITLE"
echo "Output: $OUTPUT"

typst compile --format=pdf src/audit.typ "$OUTPUT" --font-path src/fonts --input "repository=$REPOSITORY"

echo "... Done!"
