#!/bin/bash

# Function to detect -h flag and show help for this script
show_help() {
	local OPTIND 
	while getopts ":h" opt ; do
		case "$opt" in 
			h )
			       	echo "This script modifies file names"
			  	echo "-l lowerize file names"
			  	echo "-u uppercase file names"
			  	echo "-r recurse into directory"
			  	echo "[-r] <sed pattern> specify sed pattern that will be executed on file names"
			  	echo "-h show this help information"
				;;
	  esac
	done	
}

show_help "$@"
