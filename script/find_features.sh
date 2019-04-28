#!/bin/bash
function find_features(){
	for file in $(ls $1)
	do
		if [ -d $1"/"$file ]
		then
			find_features $1"/"$file $2
		else
			if grep -q utilfeature.DefaultFeatureGate.Enabled'(features.'$2')' $1"/"$file
			then
				echo $1'/'$file':'
				grep -n utilfeature.DefaultFeatureGate.Enabled'(features.'$2')' $1"/"$file
			fi
		fi
	done
}

find_features $1 $2
