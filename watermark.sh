#!/bin/bash

input_folder="./images-preview"
output_root="./out/images-preview"

mkdir -p $output_root

count=1

for file in "$input_folder"/**/*.jpg; do

  # ファイル名を取得し、拡張子を削除
  filename=$(basename "$file")

  dirname=$(dirname "$file")
  dir=$(echo ${dirname} | awk -F "/" '{ print $NF }')

  basedir="${input_folder}/${dir}"
  source="$basedir/$filename"

  outdir="${output_root}/${dir}"

  # resize original size
  mkdir -p $outdir
  out_file="${outdir}/${filename}"
  convert $source watermark.png -gravity center -composite $out_file

  echo "Done(${count})" $source
  count=$(( count + 1 ))

done


