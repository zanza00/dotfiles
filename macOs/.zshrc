export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=/usr/local/bin:/usr/local/sbin:usr/sbin:/sbins:/opt/X11/bin:/opt/local/bin:/opt/local/sbin:~/bin:/Users/simonepicciani/.cargo/bin:/Users/simonepicciani/go/bin:$PATH

source /Users/simonepicciani/antigen.zsh
antigen bundle osx
antigen apply

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# vars
HISTFILE=$HOME/.zhistory # where the file will be saved
HISTSIZE=1000000 # the size in bytes it can grow up to
SAVEHIST=1000000 # the maximum number of commands to save I guess

# only works this way
EDITOR=code-insiders

# Visual Studio Code - Insiders => code .
alias code='code-insiders'

# Fuzzy Finder Stuff => https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# Aliases

alias tpb='git-town prune-branches'

alias cns='open -a Google\ Chrome\ Canary --args --disable-web-security --user-data-dir=$HOME/Documents/development/canary-without-security --remote-debugging-port=9223 --auto-open-devtools-for-tabs'

alias ll='exa -abghl --git --color=automatic'

alias cht='cht.sh'

alias hp='hophop'

alias hft='hophop gh feature'

alias hpr='hophop gh pr'

eval $(thefuck --alias)

# Display something on init
# Fancy Mooo
fortune | cowsay | lolcat
