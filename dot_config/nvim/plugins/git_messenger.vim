" Plugin: Git Messenger
" Author: rhysd
" Repo:   https://github.com/rhysd/git-messenger.vim

" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{
" Default activation mapping: <Leader>gm <Plug>

" }}}

" FIXME: Plugin is currently broken?

" Settings {{{

let g:neotags_recursive = 1

" Use this option for the_silver_searcher
let g:neotags_find_tool = 'ag -g ""'

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{

" }}}

" Highlighting {{{

" Normal color in popup window with 'CursorLine'
hi link gitmessengerPopupNormal CursorLine

" Header such as 'Commit:', 'Author:' with 'Statement' highlight group
hi link gitmessengerHeader Statement

" Commit hash at 'Commit:' header with 'Special' highlight group
hi link gitmessengerHash Special

" History number at 'History:' header with 'Title' highlight group
hi link gitmessengerHistory Title

" Color of 'end of buffer'. To hide '~' in popup window, set 'None'
hi gitmessengerEndOfBuffer term=None guifg=None guibg=#1e1c31 ctermfg=None ctermbg=None

" }}}
