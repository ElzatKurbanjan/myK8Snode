#!/bin/bash
function delete_test(){
	for file in $(ls $1)
	do
		if [ -d $1"/"$file ]
		then
			delete_test $1"/"$file
		else
			filename=$(basename $file)
			if [ $filename != "test.go" ]
			then	
				if [ ${filename##*_} = "test.go" ]
				then
					rm $1"/"$file
				fi
			fi
		fi
	done
}

delete_test $1
