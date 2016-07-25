#!/bin/sh
#Backup default emacs file
if [ -f  ~/.emacs.bk ]
then
  mv ~/.emacs ~/.emacs.bk
fi

#Load spacemacs emacs.d backup if any
if [ -d ~/.emacs.d.spacemacs.bk ]
then
  #Backup default emacs.d if any
  if [ -d ~/.emacs.d ]
  then
    #Remove old backup directory
    if [ -d ~/.emacs.d.default.bk ]
    then
      rm -rf ~/.emacs.d.default.bk
    fi
    mv ~/.emacs.d ~/.emacs.d.default.bk
  fi
  #Load spacemacs emacs.d backup
  mv ~/.emacs.d.spacemacs.bk ~/.emacs.d
fi


