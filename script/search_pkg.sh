#!/bin/bash
function search_pkg(){
        for file in $(ls $1)
        do
                if [ -d $1"/"$file ]
                then
                        search_pkg $1"/"$file $2
                else
                        if [ $file != "BUILD" ]
                        then
                                if grep -q .'/'$2 $1"/"$file
                                then
                                        echo $1'/'$file':'
                                        grep -n .'/'$2 $1"/"$file
                                        echo
                                fi
                        fi
                fi
        done
}

search_pkg $1 $2

