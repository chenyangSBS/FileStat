#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

SRC_DIR="./src/main/java"
RSC_DIR="./src/main/resources"
PACKAGE="org/example"
CLASS_NAME="FileStat"
CLASS_PATH="$SRC_DIR/$PACKAGE/$CLASS_NAME.java"
if [ -f "$CLASS_PATH" ]; then
    javac -d "$SRC_DIR" "$CLASS_PATH"
    if [ $? -eq 0 ]; then

        OUTPUT=$( java -cp "$SRC_DIR" $PACKAGE.$CLASS_NAME "$@" )
        wordCount=$(cat "$RSC_DIR/wordStat.txt")
        echo "$wordCount"
    else
        echo "编译失败，请检查Java代码。"
    fi
else
    echo "Java文件不存在，请确保文件名和路径正确。"
fi