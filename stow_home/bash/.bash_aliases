# general settings {{{

  # Make sure that your .bashrc contains these lines:

  # if [ -f ~/.bash_aliases ]; then
  #     . ~/.bash_aliases
  # fi

  # Set keyboard layout to US layout with German special characters
  # Also maps caps lock to escape
  # setxkbmap -layout de -variant us -option caps:escape

  # Vim Mode
  set -o vi

  # Source: https://askubuntu.com/questions/87061/can-i-make-tab-auto-completion-case-insensitive-in-bash
  bind 'set completion-ignore-case on'
#}}}

# check if neovim is installed {{{

  if type nvim > /dev/null 2>&1; then

    # Set default editor for cronjob
    # and other applications
    export EDITOR=/usr/bin/nvim
    alias vim="nvim"
    alias vi="nvim"
    alias v="nvim"
  else
    export EDITOR=/usr/bin/vim
    alias vi="vim"
    alias v="vim"
  fi
# }}}

# editing and loading config files {{{
  # bash
  alias ebash="vim ~/.bash_aliases"
  alias lbash="source ~/.bashrc"

  # vim
  alias evim="vim ~/.vimrc"

  # tmux
  alias etmux="vim ~/.tmux.conf"
# }}}

# directories {{{
  REPOSITORIES="$HOME/Repositories"
  DOTFILES="$HOME/.dotfiles"
  DOWNLOADS="$HOME/Downloads"

  alias ..="cd .."
  alias ...="cd ../.."
  alias ....="cd ../../../"

  alias h="cd"
  alias go="cd"
  alias dow="cd $DOWNLOADS"
  alias re="cd $REPOSITORIES"
  alias dot="cd $DOTFILES"
# }}}

# interactive file manipulation {{{
  alias cp="cp -iv"          # confirm before overwriting something
  alias rm="rm -iv"          # confirm before removing
  alias mv="mv -iv"          # confirm before overwriting something
  alias mkdir="mkdir -p"     # Make sure that the parent directory also gets created if it doesn't exist
#}}}

# ls aliases {{{
  alias ll="ls -alFh"
  alias la="ls -A"
  alias l="ls -CF"
  alias lt="ls --tree"
  alias ltr="ll -trh"
  alias lg="ll | grep -i"
# }}}

# misc {{{
  alias sesh="tmux attach"
  alias ta="tmux attach"
  alias hgrep="history | grep"
  alias psa="ps aux | grep -i"
  alias dsa="sudo docker ps -a"
  alias tulpen="sudo netstat -tulpen"
  alias listen="sudo netstat -tulpen | grep LISTEN"
  alias findall="find . -iname"
  alias dirsize='du -sh'
  alias diskusage='du -sh * | sort -h'
  alias rsync-cp="rsync -azvhP"

  # Keyboard layouts for graphical environment
  alias kb-us="setxkbmap -layout de -variant us -option caps:escape"
  alias kb-de="setxkbmap -layout de -option caps:escape"

  # Non-robust version of OMZ's take
  function take() {
    mkdir -p "$1"
    cd "$1"
  }
# }}}

# git aliases {{{
  alias gis="git status"
  alias gip="git pull"
  alias gia="git add -A"
  alias gif="git fetch && git status"
  alias giff="git diff"
  alias gifft="git difftool"
  alias giffs="git diff --staged"
  alias giffst="git difftool --staged"
  alias gtree="git log --oneline --decorate --graph --all"
  alias gish="git show -1"
  alias gio="git log --oneline"
  alias gitc="git checkout"
  alias gunstage="git restore --staged"
  alias grestore="git restore"
  alias gii="git add --interactive"
  alias gusch="git push"
  alias gistl="git stash list"
  alias gist="git stash -u"
  alias gistp="git stash apply"
  alias gippp="git stash -u && git pull && git stash apply"
  alias ginfo="git config --local --list"

  alias tigs="tig stash"

  function tiga(){
    if [ $# -eq 0 ]; then
      echo "tiga <author name>"
      return
    fi

    author="${@}"
    command tig --author="$author"
  }

  alias gicc="git commit"

  function gic(){
    if [ $# -eq 0 ]; then
      echo "gic <commitmessage>"
      return
    fi

    commit_message="${@}"
    command git commit -m "$commit_message"
  }
# }}}

# util functions {{{

  # This alias gives you a TL;DR version of the man pages.
  # Examples are also included!
  # Usage: cheat commandname
  function cheat(){
    command curl "cheat.sh/$1"
  }

  alias myip="curl ipinfo.io"
  alias myinterface="echo $(ip route get 1.1.1.1 | awk -- '{printf $5}')"

  function extract {
    if [ -z "$1" ]; then
      echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
      if [ -f $1 ] ; then
        case $1 in
          *.tar.bz2)   for file in "$@"; do tar xvjf "$file"; done;;
          *.tar.gz)    for file in "$@"; do tar xvzf "$file"; done;;
          *.tar.xz)    for file in "$@"; do tar xvJf "$file"; done;;
          *.lzma)      for file in "$@"; do unlzma "$file"; done;; *.bz2)       for file in "$@"; do bunzip2 "$file"; done;;
          *.rar)       for file in "$@"; do unrar x -ad "$file"; done;;
          *.gz)        for file in "$@"; do gunzip "$file"; done;;
          *.tar)       for file in "$@"; do tar vvxf "$file"; done;;
          *.tbz2)      for file in "$@"; do tar xvjf "$file"; done;;
          *.tgz)       for file in "$@"; do tar xvzf "$file"; done;;
          *.zip)       for file in "$@"; do unzip -d "${file%.*}" "$file"; done;;
          *.Z)         for file in "$@"; do uncompress "${file%.*}" "$file"; done;;
          *.7z)        for file in "$@"; do 7z x "${file%.*}" "$file"; done;;
          *.xz)        for file in "$@"; do unxz "${file%.*}" "$file"; done;;
          *.exe)       for file in "$@"; do cabextract "${file%.*}" "$file"; done;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
      else
          echo "$1 - file does not exist"
      fi
    fi
  }

  # Upload snippet to termbin
  # Example: cat example.txt | termbin
  alias termbin='nc termbin.com 9999 | xclip && xclip -o'

  # Get information about command
  function wat(){
    if [ $# -eq 0 ]; then
      echo "Needs argument!"
      return
    fi

    # Ignore error output
    # if one of the functions is not built-in!
    echo "------"
    echo "which:"
    which $1 2> /dev/null
    echo "------"
    echo ""

    echo "------"
    echo "whereis:"
    whereis $1 2> /dev/null
    echo "------"
    echo ""

    echo "------"
    echo "whatis:"
    whatis $1 2> /dev/null
    echo "------"
    echo ""

    echo "------"
    echo "where:"
    where $1 2> /dev/null
    echo "------"

    echo "------"
    echo "alias:"
    alias $1 2> /dev/null
    echo "------"
  }
#}}}

# yay {{{
  # Search for package
  function yss(){
    if [ $# -eq 0 ]; then
      echo "yss <searchterm>"
      return
    fi
    command yay -Ss "${@}"
  }

  # Install package
  function yas(){
    if [ $# -eq 0 ]; then
      echo "yas <packagename>"
      return
    fi
    command yay -S "${@}"
  }

  # Remove package
  function yar(){
    if [ $# -eq 0 ]; then
      echo "yar <packagename>"
      return
    fi
    command yay -Rsn "${@}"
  }

  alias mj="yay -Syyu --sudoloop"
  alias mjc="yes | yay -Yc && yes | yay -Sc"
  alias mqs="pacman -Qs"
  alias mqi="pacman -Qi"
# }}}


# Enable zoxide if installed
# Install: curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
if type zoxide > /dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi

# Enable starship if installed
# Install: curl -sS https://starship.rs/install.sh | sh
if type starship > /dev/null 2>&1; then
  eval "$(starship init bash)"
fi

# Enable fzf if installed
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
