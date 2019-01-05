# spacemacs-dotfiles
## Install Emacs
    # Install it with this command:
    $ brew install emacs --HEAD --use-git-head --cocoa --srgb
    # To get Emacs into Application folder 
    $ brew linkapps
    # Update alias to make homebrew emacs default emacs by adding the following line to .bash_profile
    alias emacs="/usr/local/Cellar/emacs/HEAD/bin/emacs -nw --insecure"
## Install ag search
    brew install ag
## Install spacemacs 0.200.13
    git clone -b 'v0.200.13' --single-branch --depth 1  https://github.com/syl20bnr/spacemacs.git
## Install dotfiles
    git clone git@github.com:dangnm/spacemacs-dotfiles.git
    mv spacemacs-dotfiles ~/.spacemacs.d
## Setup Spacemacs
    Run sh ~/.spacemacs.d/link.sh to toggle
    OR 
    ln -sf ~/spacemacs/assets ~/.emacs.d/assets
    ln -sf ~/spacemacs/core ~/.emacs.d/core
    ln -sf ~/spacemacs/init.el ~/.emacs.d/init.el
    ln -sf ~/spacemacs/layers ~/.emacs.d/layers
    ln -sf ~/spacemacs/private ~/.emacs.d/private
    ln -sf ~/spacemacs/spacemacs.mk ~/.emacs.d/spacemacs.mk

## Restore default emacs (optional)
    Run sh ~/.spacemacs.d/link.sh to toggle
    OR 
    unlink ~/.emacs.d/assets
    unlink ~/.emacs.d/core
    unlink ~/.emacs.d/init.el
    unlink ~/.emacs.d/layers
    unlink ~/.emacs.d/private
    unlink ~/.emacs.d/spacemacs.mk

## Run spacemacs in 0.1s
Add this code to .zshenv and run emacs by typing "em"

```
  unalias em >/dev/null 2>&1
  em() {
    if [[ $(ps aux | grep -w "emacs --daemon" | grep -v grep | wc -l) -gt 0 ]]; then
        echo "daemon is running"
        if [[ $(ps aux | grep -w "emacs --daemon" | grep -v grep | wc -l) -gt 1 ]]; then
            kill -9 $(ps aux | grep 'emacs --daemon' | grep -v 'grep' | awk '{print $2}')
            emacs --daemon
        fi
    else
        echo "daemon is starting"
        emacs --daemon
    fi

    if [[ "$@" == "" ]]; then
        emacsclient -create-frame --alternate-editor="" .
    else
        emacsclient -create-frame --alternate-editor="" "$@"
    fi
  }
```



