# Variables
type -q hx && set -gx EDITOR hx
test -d /Users/nicolas/.docker/bin && set -gx PATH /Users/nicolas/.docker/bin $PATH
test -d /run/current-system/sw/bin && set -gx PATH /run/current-system/sw/bin $PATH

# Functions
function fish_greeting
    printf (set_color --bold 00FFFF)"Greetings, User. Welcome to the Grid.\n"(set_color normal)
end

# Abbreviations
abbr -a la ls -la
abbr -a vi nvim
abbr -a vim nvim

abbr -a ga git add
abbr -a gb git branch -l
abbr -a gc git commit
abbr -a gd git diff
abbr -a gf git fetch
abbr -a gl git log
abbr -a gm git merge
abbr -a gpl git pull
abbr -a gps git push
abbr -a gr git restore
abbr -a gst git status
abbr -a gsc git switch -c
abbr -a gsw git switch

abbr -a dcu docker compose up
abbr -a dcw docker compose watch
abbr -a dcd docker compose down
abbr -a dcp docker compose ps
abbr -a dcl docker compose logs -f

abbr -a cc nono run --profile claude --allow . -- claude
abbr -a oc nono run --profile opencode --allow . -- opencode
abbr -a co nono run --profile copilot-cli --allow-cwd -- copilot

# Init scripts
type -q starship && starship init fish | source
type -q zoxide && zoxide init fish | source
type -q mise && mise activate fish | source
### bling.fish source start
test -f /usr/share/ublue-os/bling/bling.fish && source /usr/share/ublue-os/bling/bling.fish
### bling.fish source end
