" Plugin:       fruzzy
" Author:       raghur
" Repo:         https://github.com/raghur/fruzzy
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      Improved fuzzy matching for Denite
" Dependencies: Denite

" Settings {{{

" optional - but recommended - see below
let g:fruzzy#usenative = 1

" When there's no input, fruzzy can sort entries based on how similar they are to the current buffer
" For ex: if you're on /path/to/somefile.h, then on opening denite, /path/to/somefile.cpp
" would appear on the top of the list.
" Useful if you're bouncing a lot between similar files.
" To turn off this behavior, set the variable below  to 0

let g:fruzzy#sortonempty = 1 " default value

" tell denite to use this matcher by default for all sources
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])

" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{



" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}

