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

cp ./dist/heicConverter.exe $outdir
cp ./dist/heicConverterGui.exe $outdir
