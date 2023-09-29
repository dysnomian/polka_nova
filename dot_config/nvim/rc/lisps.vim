" Lisps
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Settings {{{

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,javascript,typescript,vue RainbowParentheses
augroup END

" }}}
