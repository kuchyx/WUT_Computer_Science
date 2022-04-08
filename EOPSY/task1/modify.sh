#!/bin/bash
# command options and arguments interpreter example
# simple version

# the name of the script without a path
name=`basename $0`

help()
{
	echo "-l <dir/file names...> -> lowerize file/folder name"
	echo "-u <dir/file names...> -> uppercase file/folder name"
	echo "-r [-l|u] -> lowerize or uppercase file/folder name recursively"
	echo "<sed pattern> <dir/file names...> -> call sed command operating on file/folder name"
	echo "-r <sed pattern> <dir/file names...> -> call sed command operating on file/folder recursively"
	echo "-h -> display this message"
}




uppercase()
{

        if test -z "$1"
        then
                error_msg "missing filename for -u"
                exit 1
        fi
	mv "$1" $(echo "$1" | sed -r -e 's/.*/\U&/');

		

}

lowercase()
{
	if test -z "$1"
	then
		error_msg "missing filename for -l"
		exit 1
	fi
	if test -f "$1"
	then
		if test -d "$1"
		then
			error_msg "$1 is neither a file nor the folder"
			exit 2
		fi
	fi
	mv "$1" $(echo "$1" | sed -r -e 's/.*/\L&/');
}

sneed()
{
	if test -z "$1"
	then
		error_msg "missing sed pattern"
		exit 1
	fi
	if test -z "$2"
	then
		error_msg "missing sed filename"
		exit 2
	fi
	echo "$1"
	echo $1
	mv "$2" $(echo "$2" | sed $1)
}

recursionSneed()
{
	if test -z "$1"
	then
		error_msg "missing sed pattern"
		exit 1
	fi

	if test -z "$2"
	then
		error_msg "missing sed filename"
		exit 2
	fi
	
	if test -d "$2"
        then
        sneed "$1" "$2"
        cd "$2"
        for file in *
        do
                recursionSneed "$1" "$file"
        done
        fi

        if test -f "$2"
        then
        sneed "$1" "$2"
        fi



}

recursionLowercase()
{
	lowercase "$1"
	set "$(echo "$1" | sed -r -e 's/.*/\L&/')"
	for item in "$1"/* 
	do
		if test -d "$item"
		then
			recursionLowercase "$item"
		fi
		if test -f "$item"
		then
			lowercase "$item"
		fi
	done
}

recursionUppercase()
{
	uppercase "$1"
        set "$(echo "$1" | sed -r -e 's/.*/\L&/')"
        for item in "$1"/*
        do
                if test -d "$item"
                then
                        recursionUppercase "$item"
                fi
                if test -f "$item"
                then
                        uppercase "$item"
                fi
        done

}

recursion()
{
	if test -z "$1"
	then
		error_msg "missing argument for -r"
		exit 1
	fi
	
       	case "$1" in
		-l|--lowercase) recursionLowercase "$2";;
       	        -u|--uppercase) recursionUppercase "$2";;
               	*) recursionSneed "$1" "$2";;
	esac
}



# function for printing error messages to diagnostic output
error_msg() 
{ 
        echo "$name: error: $1" 1>&2 
}

# function for servicing -w option


# if no arguments given
if test -z "$1"
then
	help
fi


# do with command line arguments
while test "x$1" != "x"
do
        case "$1" in
                -h|--help) help;;
                -l|--lowercase) lowercase "$2";;
		-r|--recursion) recursion "$2" "$3" ;;
		-u|--upercase) uppercase "$2";;
		*) sneed "$1" "$2" ;;
        esac
        shift
done




