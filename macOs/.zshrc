export PATH=/usr/local/git/bin:/usr/local/bin:$PATH:/usr/local/sbin:usr/sbin:/sbins:/opt/X11/bin:/opt/local/bin:/opt/local/sbin:~/bin:$PATH

source /Users/simonepicciani/dev/github/dotfiles/macOs/sourceable.sh

# NVM Stuff
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# vars
HISTFILE=$HOME/.zhistory # where the file will be saved
HISTSIZE=1000000 # the size in bytes it can grow up to
SAVEHIST=1000000 # the maximum number of commands to save I guess

# only works this way
EDITOR=code-insiders

# Visual Studio Code - Insiders => code .
alias code='code-insiders'

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
alias ghco='githubCloneAndOpen'

# Fuzzy Finder Stuff => https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# Aliases
# alias isc='ionic serve -w "Google Chrome"'
alias tunneeeel='ssh -D 1080 -f root@163.172.191.137 sleep 60; spotify play'
# clean thing that make the startup too slow
alias zclean='rm -f ~/.zcompdump*'

alias init='source /Users/simonepicciani/antigen.zsh'
alias antgit='antigen bundle git'

eval $(thefuck --alias)

# Display something on init
# Fancy Mooo
fortune | cowsay | lolcat
