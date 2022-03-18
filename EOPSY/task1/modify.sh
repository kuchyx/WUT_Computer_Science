#!/bin/bash

show_help() {
	local OPTIND
	while getopts ":h" opt ; do
		echo "This script modifies file names"
		echo "-l lowerize file names"
		echo "-u uppercase file names"
		echo "-r recurse into directory"
		echo "[-r] <sed pattern> specify sed pattern that will be executed on file names"
		echo "-h show this help information"
	done	
}

show_help "$@"
