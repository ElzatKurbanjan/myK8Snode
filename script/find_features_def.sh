#!/bin/bash
function find_features(){
        for file in $(ls $1)
        do
                if [ -d $1"/"$file ]
                then
                        find_features $1"/"$file $2
                else
               		if [ $file != "BUILD" ]
			then
				LilCaseOfFeatures=$(echo $2 | tr '[A-Z]' '[a-z]') 
				if grep -q -F $LilCaseOfFeatures'.' $1"/"$file
                        	then
                                	echo $1'/'$file':'
                                	grep -n -F $LilCaseOfFeatures'.' $1"/"$file
                                	echo
                        	fi
			fi
                fi
        done
}

find_features $1 $2

