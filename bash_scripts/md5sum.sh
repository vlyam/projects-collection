#!/bin/bash
read -p "Enter path for control: "  pathcheck
read -p "enter path for result file: " pathresult 
for var in  $pathcheck/*
  do	
	if [ -f $var ]; then
		echo  "file name - " $var
		md5sum $var >> $pathresult/result-md5sum.txt
	fi
  done
