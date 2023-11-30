#!/bin/bash

# Goal: convert commas to spaces for a csv file

# references: 
# https://stackoverflow.com/questions/1271222/replace-whitespace-with-a-comma-in-a-text-file-in-linux


### Method 1: using cat and tr

# handle wrong or missing inputs: 

#------------------

if [[ `ls ../Data/Temperatures/*.csv` ]]
then
    for i in `ls ../Data/Temperatures/*.csv`; do
        cat $i | tr " " "," > $i.csv      # my01.csv.csv
        echo $i.csv

    done
else 
    echo "Wrong directory or file name. "
fi


exit

# method 1 inspiration    cat $1 | tr -s "\t" "," >> $1.csv

### Method 2: using sed


# Dr. Pawar's codes for this task: 
# tabtocsv.sh:

# echo "Creating a comma delimited version of $1 ..."
# cat $1 | tr -s "\t" "," >> $1.csv
# echo "Done!"
# exit


