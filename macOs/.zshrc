source "$HOME/.antigen/antigen.zsh"

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle brew
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle docker
antigen bundle git
# antigen bundle npm # fail with permission ???
antigen bundle osx
antigen bundle nvm

antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Theme
# antigen use oh-my-zsh
# antigen theme minimal

antigen apply

export PATH=/usr/local/git/bin:/usr/local/bin:$PATH:/usr/local/sbin:usr/sbin:/sbins:/opt/X11/bin
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/bin:$PATH

# NVM Stuff
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

#vars
HISTFILE=$HOME/.zhistory # where the file will be saved
HISTSIZE=10000 # the size in bytes it can grow up to
SAVEHIST=10000 # the maximum number of commands to save I guess

# Visual Studio Code - Insiders => code .
# if use integrated need to search by `code-insiders`, i'm lazy'
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

# clone a github repo and opened it with code 
function githubCloneAndOpen { 
          if [[ $# = 0 ]]
    then
        echo "I need the url of the repo :("
    else
        local url="$1"
        local repo=$(basename $url)
        local dirName=${repo%.*}
        eval "git clone $url && cd $dirName && code ."
    fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Fuzzy Finder Stuff => https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias fuzzyFileFinder='find ~/* -type f | fzf'
alias fuzzyDirFinder='find ~/* -type d | fzf'

alias fo='open "$(fuzzyFileFinder)"'
alias cdf='cd "$(fuzzyDirFinder)"'
alias copyFile='fzf | pbcopy'
alias copyDir='fuzzyDirFinder | pbcopy'


# Aliases
# alias isc='ionic serve -w "Google Chrome"'
alias tunneeeel='ssh -D 1080 -f root@163.172.191.137 sleep 60; spotify play'
# clean thing that make the startup too slow
alias zclean='rm -f ~/.zcompdump*'

# Display something on init
echo 'custom commands => fo, cdf, copyFile, copyDir, tunneeeel'

fortune | cowsay | lolcat
