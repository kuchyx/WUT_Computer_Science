#!/bin/bash

while getopts ":h" option; do
	echo "This script modifies file names"
	echo "-l lowerize file names"
	echo "-u uppercase file names"
	echo "-r recurse into directory"
	echo "[-r] <sed pattern> specify sed pattern that will be executed on file names"
	echo "-h show this help information"
done
