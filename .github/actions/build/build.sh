#!/bin/sh

set -e
if [ $# -eq 0 ]; then
	outdir=$(pwd)
else
	if [ -z "$1" ]; then
		outdir=$(pwd)
	else
		outdir=$1
	fi
fi
export HOME=/root

wine C:/Python/python.exe -m pip install -r requirements.txt
wine C:/Python/python.exe -m pip install tqdm
wine C:/Python/python.exe -m PyInstaller -F heicConverter.py
wine C:/Python/python.exe -m PyInstaller -F heicConverterGui.py

mkdir ./dist/cli/
mkdir ./dist/gui/
cp -r ./lang ./dist/cli
cp -r ./lang ./dist/gui
cp ./dist/heicConverter.exe ./dist/cli
cp ./dist/heicConverterGui.exe ./dist/gui

zip -9rq heicConverter.zip ./cli/*
zip -9rq heicConverterGui.zip ./gui/*

cp ./dist/heicConverter.zip $outdir
cp ./dist/heicConverterGui.zip $outdir
