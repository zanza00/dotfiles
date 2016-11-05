source "$HOME/.antigen/antigen.zsh"

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle git
antigen bundle brew
antigen bundle npm
antigen bundle common-aliases

# Theme
# antigen use oh-my-zsh
# antigen theme minimal

antigen apply

export PATH=/usr/local/git/bin:/usr/local/bin:$PATH:/usr/local/sbin:usr/sbin:/sbins:/opt/X11/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/bin:$PATH

#vars
HISTFILE=$HOME/.zhistory # where the file will be saved
HISTSIZE=10000 # the size in bytes it can grow up to
SAVEHIST=10000 # the maximum number of commands to save I guess

# aliases
alias isc='ionic serve -w "Google Chrome"'

# Visual Studio Code - Insiders => code .
 function code { 
          if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code - Insiders"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code - Insiders" "$argPath"
    fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
