#
# Tutorial followed: https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
#
# Cool terminal tools: https://remysharp.com/2018/08/23/cli-improved
#




# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git zsh-autosuggestions)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Add bin from my dotfiles
PATH=$PATH:~/Projects/dotfiles/bin

# Git aliases
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gf="git fetch"
alias gg="git gui"
alias gm="git merge"
alias gp="git pull"
alias gpo="git push origin"
alias gr="git rebase"
alias gs="git status"
alias gui="git gui"
alias rs="bundle exec rspec spec"
alias r="bundle exec rspec"
alias be="bundle exec"

# Run ls after cd
function chpwd() {
  emulate -L zsh
  lsd
}

# ls replacement
alias ls="lsd"

# du replacement
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# cat replacement
alias cat="bat"

# du replacement
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# ping replacement
alias ping="prettyping --nolegend"

# fzf replacement for ctrl+R
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# App bins
alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"
alias blender="/Applications/blender.app/Contents/MacOS/blender"

# Hack for accesign nodejs bins
PATH=$PATH:~/.asdf/installs/nodejs/10.0.0/.npm/bin

# Syntax highlighting
#source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Elixir helpers
alias dmix="DEBUG=true iex -S mix"

#
# Powerline
#
POWERLEVEL9K_MODE='nerdfont-complete'

# Add a space in the first prompt
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"

# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi

# Multiline status
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true

source  ~/.powerlevel9k/powerlevel9k.zsh-theme
# Disable showint user and host
prompt_context() {}

# Golang
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin



# Project dirs
alias api="~/Contractbook/api"
alias web"=~/Contractbook/web"
alias data"=~/Contractbook/data"
alias charts"=~/Contractbook/charts"
alias docx2pdf"=~/Contractbook/docx2pdf"
alias file_service"=~/Contractbook/file_service"

# Symlinks
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

PATH="/Users/n23/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/n23/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/n23/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/n23/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/n23/perl5"; export PERL_MM_OPT;

# Helm
HELM_HOME="~/.helm"

# Enable Elixir iex history
export ERL_AFLAGS="-kernel shell_history enabled"

