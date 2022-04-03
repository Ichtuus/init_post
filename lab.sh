#!/bin/bash 
DONE=0;
loader () {

    while [ $DONE -eq 0 ]; do
    printf -- 'doing something... \n';
    printf -- '.';
    sleep 1;
    done;
    printf -- '\033[32m PROCESS:  DONE!\n \033[0m\n';
}


FILE=$1 
if test -f "$FILE"; then 
        echo "$FILE exist."; 
        DONE=1;
        FILE_EXIST=1;
        loader
    else 
    DONE=1;
        echo "$FILE doesn\'t exist."
        FILE_EXIST=0;
        loader 
fi

if [ $FILE_EXIST -eq 0 ]; then
    echo "--- Creation of .gitconfig file."
    cp ./templates/gitconfig.template ./

    read -p "Enter your email address: " name
    sed -i "s/{{user}}/$name/" ./gitconfig.template

    read -p "Enter your name: " emailAddress
    sed -i "s/{{email}}/$emailAddress/" ./gitconfig.template

    mv ./gitconfig.template  ./.gitconfig

    loader OUTPUT=".gitconfig file has been created."
fi
# Retirer le JS pour seulement utiliser un script bash 

