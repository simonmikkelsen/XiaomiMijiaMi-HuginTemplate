#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

template="$SCRIPTPATH/../template-XiaomiMijiaMiJPG.pto"
stitchPath="$PWD"
ext="JPG"
outputDir=""

while [ "$#" != "0" ]
do
  if [ "$1" = "-h" -o "$1" = "--help" ]; then
    echo "Usage: $0 [-o]"
    echo "Stitches the JPG files in the current or given path using HUGIN."
    exit 0
  elif [ "$1" = "-o" -o "$1" = "--output" ]; then
    shift
    outputDir="$1"
  else
    echo "Unknown argument: \"$1\"."
    exit 1
  fi
  shift
done

if [ -z "$outputDir" -o ! -d "$outputDir" ]; then
  echo "Output dir '$outputDir' does not exist or is not a directory."
  exit 1
fi

cd  "$outputDir"
mkdir -p tmp_stitch
cd tmp_stitch

find "$stitchPath" -maxdepth 1 -type f -iname "*.$ext" | while read filepath
do
  file="`basename "$filepath"`"
  ptoName="${file%.*}.pto"
  cp "$filepath" .

  cat "$template" | sed "s/image.jpg/$file/g" > "$ptoName"
  hugin_executor --stitching "$ptoName"

  mv * ..

done

