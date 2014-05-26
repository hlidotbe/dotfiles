# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/

export ZSH_THEME="dpoggi"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

plugins=(brew osx gitfast ruby vagrant zsh-syntax-highlighting golang bundler)

export PATH=~/bin:~/.gem/ruby/2.0.0/bin:/usr/local/bin:$PATH

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

PAGER="less"
EDITOR='/usr/local/bin/vim'
JS_CMD='node'
GEMS_PATH=`gem env | grep "INSTALLATION DIRECTORY" | sed -e 's/.*- INSTALLATION DIRECTORY: //'`
alias v='mvim'
alias vdiff='mvimdiff'
alias g='git'
alias k='kill -9'
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias dmesg="sudo dmesg"
alias dh='dirs -v'
alias top='/usr/bin/top -ocpu -R -F -s 2 -n30'
alias gl='git log --color=always --graph --pretty="format:%C(yellow)%h %C(white)%ai%Cblue%d%Creset %s %C(magenta) %an%Creset"'
alias gt='gittower'
alias gcp='git commit -v -p'
alias gcpa='git commit -v -p -a'
alias gai='git add -v -i'
alias gk='git difftool -t Kaleidoscope'
# Quick way to rebuild the Launch Services database and get rid
# of duplicates in the Open With submenu.
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

alias grb='git rebase -p'
alias gup='git remote update -p; git merge --ff-only @{u}'
alias gm='git merge --no-ff'
alias gp='git push --follow-tags'
alias tags='git tag'

alias gitserve='git daemon --reuseaddr --export-all'

alias cwww='cd ~/Data/Sites'
alias csrc='cd ~/Data/Sources'

alias vu='vagrant up'
alias vp='vagrant provision'
alias vr='vagrant reload'
alias vs='vagrant ssh'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vsp='vagrant suspend'

alias r='rake'
alias rd='rake device'

alias wtf='for i in `seq -f "%02.0f" 1 31`; do echo "--------------------- $MONTH-$i ----------------------"; ~/bin/wtf-did-i-do Hugues $MONTH-$i; done'

alias rdeploy='rake epic:deploy'
alias rshell='rake epic:shell'

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PAGER
export EDITOR
export JS_CMD

export VMAIL_HTML_PART_READER='elinks -dump'
export VMAIL_VIM='mvim'


eval `gdircolors ~/.dircolors`

export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000

export RM_DEV_PROFILE='/Users/hli/Library/MobileDevice/Provisioning Profiles/B236632A-C07C-44CE-886F-6C8EAACC436D.mobileprovision'
export RM_DEV_CERTIFICATE='iPhone Developer: Hugues Lismonde (KS283N6B89)'
export RM_PUB_PROFILE='/Users/hli/Library/MobileDevice/Provisioning Profiles/96D692C9-FF06-4617-BD7D-D310297C4B3C.mobileprovision'
export RM_PUB_CERTIFICATE='iPhone Distribution: EPIC Web Agency Sprl'

#export SSL_CERT_FILE=/Users/hli/.rbenv/versions/2.0.0-p247/openssl/ssl/cacert.pem
[[ -f `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

function dash_man ()
{
  open dash://man:$1
}
alias man=dash_man

zstyle -s ':completion:*:hosts' hosts _ssh_config
[[ -r ~/.ssh/config  ]] && _ssh_config+=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p'))
zstyle ':completion:*:hosts' hosts $_ssh_config
