set EDITOR nvim
set BUN_INSTALL "$HOME/.bun"
set WASMER_DIR "$HOME/.wasmer"

bind ctrl-f "$HOME/.local/scripts/tmux-sessionizer"

## Path
set PATH "$HOME/.local/scripts:$PATH"
set PATH "$HOME/.cargo/bin:$PATH"
set PATH "$BUN_INSTALL/bin:$PATH"
set PATH "/opt/flutter/bin:$PATH"

abbr ll "eza -la"
abbr ls "eza -a"
abbr tree "eza --tree"
abbr g "git"
abbr gst "git status"
abbr gco "git checkout"
abbr gb "git branch"
abbr gl "git pull"

function vim
    if test -z $argv
        nvim .
    else
        nvim $argv
    end
end

function dopush
    git add .
    git commit -m $argv
    git push
end

function new_branch
    git checkout -b $argv
    git push --set-upstream origin $argv
end

function fish_greeting
end

if test -e "$WASM_DIR/wasmer.sh"
    source "$WASM_DIR/wasmer.sh"
end

if test -e "$HOME/tmp/google-cloud-sdk/path.fish.inc"
    source "$HOME/tmp/google-cloud-sdk/path.fish.inc"
end


if test -e "$HOME/tmp/google-cloud-sdk/completion.fish.inc"
    source "$HOME/tmp/google-cloud-sdk/completion.fish.inc"
end

atuin init fish --disable-up-arrow | source
starship init fish | source
mise activate fish | source
