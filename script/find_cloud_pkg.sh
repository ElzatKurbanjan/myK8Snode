#!/bin/bash
function find_cloud_pkg(){
        for file in $(ls $1)
        do
                if [ -d $1"/"$file ]
                then
                        find_cloud_pkg $1"/"$file
                else
                        if [ $file != "BUILD" ]
                        then
                                if grep -q .'/'cloudprovider $1"/"$file
                                then
                                        echo $1'/'$file':'
                                        grep -n .'/'cloudprovider $1"/"$file
                                        echo
                                fi
                        fi
                fi
        done
}

find_cloud_pkg $1
