abbr --add -- v $EDITOR

if test -x (brew --prefix)"/bin/nvim"
    abbr -a -g vim nvim
    alias archaeovim=(brew --prefix)"/bin/vim"
end

# exa, a colorized Rust replacement for ls (brew install exa)
if test -x (brew --prefix)"/bin/exa"
    alias real_ls="/bin/ls"
    alias ls="exa --color=auto"

    # List all files in long format
    abbr -a -g l "ls -l"

    # List all files in long format, including dot files
    abbr -a -g la "ls -la"

    # Tree view
    abbr --add --global tree "exa --long --tree --level=3"
end

abbr --add -- cdot "cd $DOTFILES_DIR"
abbr --add -- csrc "cd $SOURCE_DIR"

abbr --add -- chm chezmoi

## Git
abbr -a -g gco "git checkout"
abbr -a -g gci "git pull --rebase; and rake; and git push"
abbr -a -g gcm "git commit -m "
abbr -a -g gaa "git add . -A"
abbr -a -g gst "git status"
abbr -a -g gd "git diff -p"

## Ruby
abbr -a -g mux "tmuxinator start"
abbr -a -g bx "bundle exec"
abbr -a -g t "bundle exec ruby -I test"
abbr -a -g s "bundle exec rspec"
