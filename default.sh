#!/bin/sh
#Copy backup default emacs file
if [ -f  ~/.emacs ] && [ ! -f ~/.emacs.bk ]
then
  mv ~/.emacs ~/.emacs.bk
fi
cp default/.emacs ~/

#Load default emacs.d backup if any
if [ -d ~/.emacs.d.default.bk ]
then
  #Backup spacemacs emacs.d if any
  if [ -d ~/.emacs.d ]
  then
    #Remove old backup directory
    if [ -d ~/.emacs.d.spacemacs.bk ]
    then
      rm -rf ~/.emacs.d.spacemacs.bk
    fi
    mv ~/.emacs.d ~/.emacs.d.spacemacs.bk
  fi
  #Load default emacs.d backup
  mv ~/.emacs.d.default.bk ~/.emacs.d
fi

