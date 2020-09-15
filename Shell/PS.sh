#!/bin/bash
#parameter-substitution: ${var/Pattern/Replacement}
#First match of Pattern, within var replaced with Replacement
#so use this script to loop through all the appropriate files and rename each
#of them
for file in AAAAA*.r
do
    mv -i "${file}" "${file/AAAAA/BBBB}"
done
