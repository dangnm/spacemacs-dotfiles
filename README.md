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
## Install spacemacs 0.200.9
    link https://github.com/syl20bnr/spacemacs/releases
## Install dotfiles
    git clone git@github.com:dangnm/spacemacs-dotfiles.git
    mv spacemacs-dotfiles ~/.spacemacs.d
## Setup Spacemacs
    cd ~/.spacemacs.d/
    sh spacemacs.sh
## Restore default emacs (optional)
    cd ~/.spacemacs.d/
    sh default.sh
## Run spacemacs in 0.1s
Add this code to .zshenv and run emacs by typing "em"

```
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



