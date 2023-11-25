#! /bin/bash

# Created date: 16 Nov 2023
#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' yxy_learn_bash2.sh
#--------------------------------

# functions
# source: https://linuxhint.com/30_bash_script_examples/#t14  https://www.baeldung.com/linux/bash-functions 
#-------------------------------------
function F1()
{
    echo 'I like bash programming'
}

F1
#-------------------------------------

Rectangle_Area() {
    area=$(($1 * $2))
    echo "Area is : $area"
}

Rectangle_Area 5 20

#-------------------------------------

function greeting() {
    str="Hello, $name"
    echo $str   
}

echo "Enter your name"  # instruction for the user
read name               # from the keyboard, input a string

val=$(greeting)     # notice, important

echo "Return value of the function is $val"

#-------------------------------------

simple_function() {
    for ((i=0; i<5; ++i)) do
        echo -n " "$i" ";
    done
}

simple_function

echo
# source: https://www.baeldung.com/linux/bash-functions
#-------------------------------------

function simple_inputs() {
    echo "This is the first argument [$1]"
    echo "This is the second argument [$2]"
    echo "Calling function with $ arguments"
}

simple_inputs one 'two three'
# source: https://www.baeldung.com/linux/bash-functions
#-------------------------------------

sum=0
function simple_outputs() {
    sum=$(($1+$2)) 
}

simple_outputs 1 2
echo "Sum is $sum"
# source: https://www.baeldung.com/linux/bash-functions
#-------------------------------------




