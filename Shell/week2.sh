#!/bin/bash
#change the permissions of a file or directory
chmod 600 some_privite_file
chmod 700 some_provite_folder
#become the superuser for a short while
su
sudo some_command #in ubuntu
#change file ownership
su
chown you some_file
#change group ownership
chgrp new_group some_file

#job control
xload #display a graph represtening system load
xload & #put the program in the background equals xload; ctrl z; bg
jobs
kill %n
ps
kill pid
#I/O Redirection
#standard output
ls > file_list.txt
ls >> file_list.txt
#standard input
sort < file_list.txt
sort < file_list.txt > sorted_file_list.txt
#pipelines
ls -l | less
ls -lt | head #display the 10th newest files in the current directory
du | sort -nr #display a list of directories and how much space they consume, sorted from the largest to the smallest.
find . -type f -print | wc -l #dispalys the total number of files in the current working directory and all of its subdirectories
#pathname expansion
echo *
echo D*
echo *s
echo [[:upper:]]*
echo /usr/*/share
#arithmetic expansion
echo $((2+2))
#brace expansion
echo Front-{A,B,C}-Back
echo Number_{1..5}
echo {Z..A}
echo a{A{1,2},B{3,4}}b
mkdir Photos
cd Photos
mkdir {2017..2022}-0{1..9} {2017..2022}-{10..12}
ls
#parameter expansion
echo $USER
printenv | less #to see a list of available variables

#double quotes and single quotes
ls -l two words.txt
ls -l "two words.txt"
echo "$USER $((2+2)) $(cal)"
echo this is a    test
echo "this is a    test"
echo $(cal)
echo "$(cal)"

echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'
#escaping characters
echo "The balance for user $USER is: \$5.00"
echo -e "DEL C:\\WIN2K\\LEGACY_OS.EXE"
mv bad\&filename good_filename
ls -l \
   --reverse \
   --human-readable \
   --full-time

#arrays
os=('linux' 'windows')
os[2]='mac' #or os+=('mac')
echo '${os[1]}' #no single quote
echo "${os[1]}"
echo "${os[@]}" #print array values
echo "${!os[@]}" #print array indices
echo "${#os[@]}" #print length of array

#if-else
if [[ "$#" -ne 1 ]]; then
  echo "usage: $0 <argument>"
fi

# for loop
for i in ~/*; do
  if [[ -f $i ]]; then
    echo "$i is a regular file"
  else
    echo "$i is not a regular file"
  fi
done


#while loop. We prefer a while loop, since a while loop 
#allows us to iterative item by item without pre-generating
#all items in memmory

i=0
while read -r -d ''; do
  foo[i]=$REPLY
  ((i++))
done < <(find . -maxdepth 1 -print0)
echo "i is $i, size of foo ${#foo[@]}"




