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
