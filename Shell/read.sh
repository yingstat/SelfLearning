#!/bin/bash

echo -n "Enter some text > "
read text
echo "You entered: $text"

#time limit
echo -n "Hurry up and type something! > "
if read -t 3 response; then
    echo "Great, you made it in time!"
else
    echo "Sorry, you are too slow!"
fi

#password not shown

echo "Type your password: "
read -s password #the -s option causes the user's typing not to be displayed
echo "Thank you!"

