#!/bin/sh
#Backup default emacs file
if [ -d  ~/.emacs.d/assets ]
then
  unlink ~/.emacs.d/assets
  unlink ~/.emacs.d/core
  unlink ~/.emacs.d/init.el
  unlink ~/.emacs.d/layers
  unlink ~/.emacs.d/private
  unlink ~/.emacs.d/spacemacs.mk
else
  ln -sf ~/spacemacs/assets ~/.emacs.d/assets
  ln -sf ~/spacemacs/core ~/.emacs.d/core
  ln -sf ~/spacemacs/init.el ~/.emacs.d/init.el
  ln -sf ~/spacemacs/layers ~/.emacs.d/layers
  ln -sf ~/spacemacs/private ~/.emacs.d/private
  ln -sf ~/spacemacs/spacemacs.mk ~/.emacs.d/spacemacs.mk
fi
