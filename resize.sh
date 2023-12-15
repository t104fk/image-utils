#!/bin/bash

# ImageMagickがインストールされているかを確認
type convert >/dev/null 2>&1 || { echo >&2 "ImageMagickがインストールされていません。"; exit 1; }

# 引数で指定された入力フォルダと出力フォルダ
input_folder=$1
output_folder=$2

# フォルダ内のjpgファイルを処理
for file in "$input_folder"/*.jpg; do
  filename=$(basename "$file")
  dirname=$(dirname "$file")
  dir=$(echo ${dirname} | awk -F "/" '{ print $NF }')
    
  # 出力ディレクトリの作成
  mkdir -p "$output_folder/$dir"

  # リサイズして出力
  convert "$file" -resize 1920x1920\> "$output_folder/$dir/$filename"
done
