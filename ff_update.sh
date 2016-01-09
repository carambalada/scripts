#!/bin/sh

SOURCE_DIR=/home/exti/Downloads
TARGET_DIR=/opt
SOURCE_PATTERN="firefox*.bz2"

SOURCE_FILE=$(ls ${SOURCE_DIR}/${SOURCE_PATTERN})

tar xf $SOURCE_FILE -C ${TARGET_DIR}

rm $SOURCE_FILE
