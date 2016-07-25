# spacemacs-dotfiles
## Install Emacs
    # Install it with this command:
    $ brew install emacs --HEAD --use-git-head --cocoa --srgb
    # To get Emacs into Application folder 
    $ brew linkapps
    # Update alias to make homebrew emacs default emacs by adding the following line to .bash_profile
    alias emacs="/usr/local/Cellar/emacs/HEAD/bin/emacs -nw"
## Install dotfiles
    git clone git@github.com:dangnm/spacemacs-dotfiles.git
    mv spacemacs-dotfiles ~/.spacemacs.d
