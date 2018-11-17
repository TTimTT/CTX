#!/usr/bin/env bash

STARTING=$PWD
TMP_FILE="tmp.html"
DATA_FILE="data.csv"
DESC_FILE="desc.csv"

GLA_FILE="gla.csv"
FOO_FILE="foo.csv"

for directory in $(find $STARTING -type d); 
do
	cd "$directory"
	if [ -f "$DATA_FILE" ]; then
        cat "$DATA_FILE" >> "$STARTING$GLA_FILE"
    fi

	if [ -f "$DESC_FILE" ]; then
        cat "$DESC_FILE" >> "$STARTING$FOO_FILE"
    fi

	cd $STARTING
done
