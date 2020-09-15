
#!/usr/bin/bash

#press up-arrow key, you can see the command history.500 commands by default

#double click a filename to copy, press middle mouse button to paste, no ctl-c and ctl-v

#some basic commands

date

cal

df

df -h

free

exit

pwd

#absolute pathnames or relative pathnames

cd /usr/bin

#current working directory
cd ./  #can be omitted

#current working directory's parent directory
cd ../ 

cd /

#change the working directory to the previous directory
cd -

#home
cd ~
cd
#change to the home of username
cd ~username

ls

ls /specific/dir

ls /dir1 /dir2

#list files with long format
ls -l

#list all files including hidden directory 
ls -a

# command -options arguments
help cd
mkdir --help
man ls
which python
whatis ls #a brief description
#sort by modification time
ls -lt 

#check file's type
file filename

#chenck file's content
less filename

#copy only when the SOURCE file is newer than the destination file  or  when the destination file is missing
cp -u *.html destination

cp item1 item2
cp item1 item2 dir
cp dir1/* dir2/
cp -r dir1 dir2

#wildcards
* # any character
? # any single character
[abc] #any file beginning with either a, b, c
backup.[0-9][0-9] #any file begin with backup. followed by exactly two numerals
[[:upper:]]* #any file beginning with an uppercase letter
[![:digit:]]* #any file not beginning with a numeral
*[[:lower:]123] #any file ending with a lowercase letter or the numerals 1,2,3

#create directory
mkdir dir1
mkdir dir1 dir2 dir3

#move and rename files
mv  item1 item2
mv item1 item2 dir

#remove files and directories
#be careful when use rm
rm file1
rm -r file1 dir1 #delete file1 and dir1 and its contents
rm -rf file1 dir1 #same as above, expect that if either file1 or dir1 does not exist, rm will continue silently

##play with all the commands
cd 
mkdir playground
mkdir dir1 dir2
cp /etc/passwd .
ls -l
cp -i /etc/passwd #get a warning
mv passwd fun
mv fun dir1
mv dir1/fun dir2
mv dir2/fun .
mv fun dir1
mv dir1 dir2
ls -l dir2
ls -l dir2/dir1
mv dir2/dir1 .
mv dir1/fun .
cd 
rm -r playground

#display a command's name
type type
type ls
type cp

# command1; command2; command3
cd /usr; ls cd -

#create alias: alias name="string"
type ll
type foo
alias foo='cd /usr; ls; cd -'
foo
type foo
unalias foo
type foo
#see all the alias defined in the environment
alias

#redirect the standard output
ls -l /usr/bin > ls-output.txt
ll ls-output.txt
less ls-output.txt

ls -l /bin/usr > ls-output.txt
ls -l ls-output.txt
>ls-output.txt #truncate an existing file or create a new empty file
ls -l /usr/bin >> ls-output.txt #output being appended to the file
ls -l /usr/bin >> ls-output.txt
ls -l /usr/bin >> ls-output.txt
 ls -l ls-output.txt

#redirect the standard error.
ls -l /bin/usr 2> ls-error.txt






