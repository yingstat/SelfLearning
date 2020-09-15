#!/bin/bash
#parameter expansion gives us tricks to modify the string
#that will be expanded
#the following code can be used to rename all JPEG files with a .JPG or a .jpeg
#extension to have a normal .jpg extension
#the ${file%.*} cuts off everything from the end staring with the last period(.)
#then in the same quotes, a new extension is appended to the expansion results.
for file in *.JPG *.jpeg
do mv -- "$file" "${filr%.*}.jpg"
done

