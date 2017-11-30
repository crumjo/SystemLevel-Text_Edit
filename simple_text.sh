#! /bin/bash

load () {
    echo -n "Enter a file to load: "
    read file

    if [ ! -f $file ]
    then
        printf "'$file' does not exist.\n"
    else
        printf "'$file' has been loaded.\n"
    fi
}

display_file () {
    echo "Print contents of file loaded."
}

count_string () {
    echo "Prompt for string input."
    echo "Count frequency of s in file."
}

replace_string () {
    echo "Prompt for string to replace."
    echo "Prompt for new string."
}

insert_string () {
    echo "Prompt for existing string input, the new one will be inserted after."
    echo "Prompt for new string."
    echo "Insert new string after existing string."
}

delete_string () {
    echo "Prompt for string and then delete it."
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
    echo "LOAD CHOICE: $load_choice"

    if [ $load_choice -eq 1 ]
    then
        printf "Good choice!\n"
        let load_check=$load_check+1
    else
        printf "Bad choice...\n"
    fi
done

while [ 1 ]
do
    echo -n "Enter a command: "
    read cmd

    if [ $cmd -eq 8 ]
    then
        exit 1
    fi

done
