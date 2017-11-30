#! /bin/bash

load_file () {
    echo -n "Enter a file to load: "
    read file

    if [ ! -f $file ]
    then
        while [ ! -f $file ]
        do
            echo -n "'$file' does not exist. Enter an existing file: "
            read file
        done
    fi
    printf "'$file' has been loaded.\n"
}

display_file () {
    cat $1
}

count_string () {
    echo -n "Enter a string to find it's frequency: "
    read s
    freq=$(grep -o $s $1 | wc -l)
    printf "'$s' occurs $freq times.\n"
}

find_string () {
    echo -n "Enter a string to find: "
    read s
    sed -n "/$s/p" "$1"
}

replace_string () {
    echo -n "Enter a string you wish to replace: "
    read old

    echo -n "Enter the new string: "
    read new

    sed -i "s/$old/$new/g" "$1"
}

insert_string () {
    # FIX ME
    echo -n "Enter a string to insert: "
    read insert

    echo -n "Provide a string where the new one will be inserted: "
    read location

    sed -i "s/$location/$insert" "$1"
}

delete_string () {
    # FIX ME
}

echo -e "1: Load a text file \t\t\t 2: Display the text file
3: Show the frequency of a string \t 4: Find a string
5: Replace a string \t\t\t 6: Insert a string
7: Delete a string \t\t\t 8: Exit"

load_check=0

while [ $load_check -ne 1 ]
do
    echo -n "Enter a 1 to load a text file: "
    read load_choice

    if [ $load_choice -eq 1 ]
    then
		echo -n "Enter a file to load: "
		read file

		if [ ! -f $file ]
		then
			while [ ! -f $file ]
         	do
            	echo -n "'$file' does not exist. Enter an existing file: "
            	read file
       		done
     	fi
        let load_check=$loadcheck+1
    fi
done

printf "'$file' has been loaded.\n"

while [ 1 ]
do
    echo -n "Enter a command: "
    read cmd

    if [ $cmd -eq 2 ]
    then
       display_file $file
    elif [ $cmd -eq 3 ]
    then
        count_string $file
    elif [ $cmd -eq 4 ]
    then
        find_string $file
    elif [ $cmd -eq 5 ]
    then
        replace_string $file
    elif [ $cmd -eq 6 ]
    then
        insert_string $file
    elif [ $cmd -eq 7 ]
    then
        delete_string $file
    elif [ $cmd -eq 8 ]
    then
        echo "The editor will now exit."
        exit 1
    fi

done
