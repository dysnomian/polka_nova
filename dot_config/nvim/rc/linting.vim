" Linting
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

command! ALEToggleFixer execute "let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1"

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

" Toggle ALE fixers
nnoremap <Space>sf  :ALEToggleFixer<cr>

" }}}

" Highlights {{{

highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ale_linters_explicit = 1

let g:ale_linters = { }

let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }

" }}}

" ftplugins:
" ~/.config/nvim/ftplugin/clojure.vim
" ~/.config/nvim/ftplugin/css.vim
" ~/.config/nvim/ftplugin/elixir.vim
" ~/.config/nvim/ftplugin/gitlint.vim
" ~/.config/nvim/ftplugin/javascript.vim
" ~/.config/nvim/ftplugin/markdown.vim
" ~/.config/nvim/ftplugin/ruby.vim
" ~/.config/nvim/ftplugin/sass.vim
" ~/.config/nvim/ftplugin/scss.vim
" ~/.config/nvim/ftplugin/shell.vim
" ~/.config/nvim/ftplugin/terraform.vim
" ~/.config/nvim/ftplugin/typescript.vim
" ~/.config/nvim/ftplugin/vim.vim
" ~/.config/nvim/ftplugin/yaml.vim
"
"
