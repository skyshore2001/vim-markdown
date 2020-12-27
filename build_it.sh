#!/bin/sh

VER=1
VIM=vim

target=markdown-lj-$VER
$VIM -c "let g:vimball_home='./vimfiles' | %MkVimball! $target" -c "qa!" filelist.txt
gzip -f ${target}.vmb
echo "=== generate ${target}.vmb.gz"
