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

wine C:/Python/python.exe -m PyInstaller -F heicConverter.py
wine C:/Python/python.exe -m PyInstaller -F heicConverterGui.py

ls -la
