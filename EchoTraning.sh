#!/bin/bash

#This is a script to help me learn about basic

echo "Hello  world"

message="This is a test"
echo $message
echo "Whats your name?"
read My_name
echo "My name is $My_name"

echo "trying is: $myvare"
myvar="fullying out"
echo "trying is: $myvar"


for i in hello 1 *sh 2 goodbye
do
	echo "looping ... i is set to $i"
done


while i in *`ls`; do file $i; done
