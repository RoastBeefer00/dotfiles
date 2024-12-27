export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
    git 
    sudo
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_profile

export EDITOR="nvim"
export SHELL="$(which zsh)"
export PATH="$PATH:$HOME/.cargo/bin"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH=$PATH:$(go env GOPATH)/bin
#
eval "$($(which mise) activate zsh)"

alias ll="eza -la"
alias ls="eza -a"
alias tree="eza --tree"

function vim() {
    if [ -z "$@" ]; then
        nvim .
    else
        nvim $@
    fi
}

function dopush() {
    git add .
    git commit -m "$@"
    git push
}

function new_branch() {
    gco -b $@
    git push --set-upstream origin  $@
}

function update() {
    dir=$(pwd)
    cd ~/.config/home-manager
    echo "Updating flake..."
    nix flake update
    echo "Updating home-manager..."
    home-manager switch
    cd $dir
}

# Wasmer
export WASMER_DIR="/home/roastbeefer/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/roastbeefer/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/roastbeefer/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/roastbeefer/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/roastbeefer/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(starship init zsh)"
