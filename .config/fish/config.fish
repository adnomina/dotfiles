# Variables
set -gx EDITOR hx
set -gx PATH /run/current-system/sw/bin $PATH
set -gx PNPM_HOME /Users/nicolas/Library/pnpm
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end

# Functions
function fish_greeting
    printf (set_color --bold 00FFFF)"Greetings, User. Welcome to the Grid.\n"(set_color normal)
end

# Aliases
alias la="ls -la"
alias vi='nvim'
alias vim='nvim'
alias claude="nono run --profile claude-code --allow . -- claude"
alias opencode="nono run --profile opencode --allow . -- opencode"
alias cc="claude"
alias oc="opencode"

# Init scripts
starship init fish | source
zoxide init fish | source
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
