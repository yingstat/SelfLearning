AdvancedUnix
========================================================
author: 
date: 
autosize: true

Arguments
========================================================


- Arguments typically are defined using a dash (-) or two dashes (--) followed by a letter of a word.
- r: recursive. For example, rm -r <directory-name>: remove all files, subdirectories, files in subdirectories, subdirectories in subdirectories, etc.
- Combine arguments: rm -rf directory-name
- ls -a: Shows all files in the directories including hidden files (e.g. .git file when initializing using git init) (a for all).
- ls -l: Returns more information about the files (i.e. l for long).
- ls -t: Shows files in chronological order.
- ls -r: Reverses the order of how files are shown.
- ls -lart: Shows more information for all files in reverse chronological order.


Getting help and pipes
========================================================


- Getting Help: Use man + command name to get help (e.g. man ls). Note that it is not available for Git Bash. For Git Bash, you can use command -- help (e.g. ls --help).
- Pipes: Pipes the results of a command to the command after the pipe. Similar to the pipe %>% in R. For example, man ls | less (and its equivalent in Git Bash: ls --help | less). Also useful when listing files with many files (e.g ls -lart | less).

Wild cards
========================================================

- * means any number of any combination of characters. Specifically, to list all html files: ls *.html and to remove all html files in a directory: rm *.html.
- ? means any single character. For example, to erase all files in the  form file-001.html with the numbers going from 1 to 999: rm file-???.html.
- Combined wild cards: rm file-001.* to remove all files of the name file-001 regardless of suffix.
- Warning: Combining rm with the * wild card can be dangerous. There are combinations of these commands that will erase your entire file system without asking you for confirmation. Make sure you understand how it works before using this wild card with the rm command.

Wild cards
========================================================

- In Unix, variables are distinguished from other entities by adding a $ in front. For example, the home directory is stored in $HOME.
- See home directory: echo $HOME
- See them all: env   
- See what shell is being used: echo $SHELL (most common shell is bash)
- Change environmental variables: (Don’t actually run this command though!) export PATH = /usr/bin/

Executables, Permissions, and File Types
========================================================

- In Unix, all programs are files. They are called executables. So, ls, mv, and git are all files.
- To find where these program files are, use which. For example, which git would return /usr/bin/git.
- Type ls /usr/bin to see several executable files. There are other directories that hold program files (e.g. Application directory for Mac or Program Files directory in Windows).
- Type echo $PATH to see a list of directories separated by ":".
- Type the full path to run the user-created executables (e.g ./my-ls).
- Regular file -, directory d, executable x. 
- This string also indicates the permission of the file: is it readable? writable? executable? Can other users on the system read the file? Can other users on the system edit the file? Can other users execute if the file is executable?

Commands You Should Learn
========================================================

- Be aware of common commands and know what they do.

- open/start - On the mac open filename tries to figure out the right application of the filename and open it with that application. This is a very useful command. On Git Bash, you can try start filename. Try opening an R or Rmd file with open or start: it should open with RStudio.

- nano - A bare-bones text editor.

- ln - create a symbolic link. We do not recommend its use, but you should be familiar with it.

- tar - archive files and subdirectories of a directory into one file.

- ssh - connect to another computer.

- grep - search for patterns in a file.

- awk/sed - These are two very powerful commands that permit you to find specific strings in files and change them.

