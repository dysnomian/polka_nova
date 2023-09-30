augroup chezmoi
    autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path "%"
augroup END

