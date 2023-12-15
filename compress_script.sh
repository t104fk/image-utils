#!/bin/bash

# ImageMagickがインストールされているかを確認
type convert >/dev/null 2>&1 || { echo >&2 "ImageMagickがインストールされていません。"; exit 1; }

# 引数で指定された入力フォルダ、中間フォルダ、最終出力フォルダ
input_folder=$1
intermediate_folder=$2
output_folder=$3

# リサイズ
./resize.sh "$input_folder" "$intermediate_folder"

# WebP化
./webp.sh "$intermediate_folder" "$output_folder"
