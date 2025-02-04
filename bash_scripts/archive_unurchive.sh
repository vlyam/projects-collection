#!/bin/bash

ARHPATH=.
EXTPATH=./unarchive_folder
DATE=`date '+%d-%m-%y'`
read -p "Archpath: " ARHPATH
read -p "EXTPATH: " EXTPATH

echo $DATE
for i in {1..5}
do
	mkdir -p Dir$i
	echo "Directory Dir$i created"
	for j in {1..5}
	do 
		date +'%H-%M-%S' > Dir$i/File-$j.txt
		echo "file File-$j.txt created"
		sleep 1
	done
	echo "Dir$i contains:"
	ls Dir$i
	sleep 1
done

tar -czvf $ARHPATH/Arh-$DATE.tar.gz Dir* >> ArhList.txt
echo "files archived to $ARHPATH/Arh-$DATE.tar.gz"
sleep 3
mkdir -p $EXTPATH
tar -xzf $ARHPATH/Arh-$DATE.tar.gz -C $EXTPATH
echo "files unarchived to $EXTPATH"
