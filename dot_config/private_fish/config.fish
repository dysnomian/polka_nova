if status is-interactive
    # Commands to run in interactive sessions can go here
end

##########     Environment     ##########

### Load homebrew environment variables
# https://docs.brew.sh/Manpage#environment
if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if test -x /usr/local/bin/brew
    eval (/usr/local/bin/brew shellenv)
else
    echo "ERROR: Couldn't find homebrew location!"
end

### Load homebrew completions
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

### 1Password completions

if test -x (brew --prefix)"/bin/op"
    op completion fish | source
end

### Direnv config
if test -x (brew --prefix)"/bin/direnv"
    direnv hook fish | source
end

### Load asdf, an everything version switcher
source (brew --prefix)/opt/asdf/libexec/asdf.fish

### Configure 1Password plugins
if test -e "$HOME/.config/op/plugins.sh"
    source ~/.config/op/plugins.sh
end

source ~/.config/fish/env.fish

##########     Abbreviations     ##########

source ~/.config/fish/abbr.fish

##########     Secrets     ##########

# source ~/.config/fish/secrets.fish

##########     Functions     ##########

function reload
    source ~/.config/fish/config.fish
end
