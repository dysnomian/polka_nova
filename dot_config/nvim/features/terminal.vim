" Terminal configuration
"
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Settings {{{

" Open terminal in horizontal split
command! -nargs=* T split | resize 20 | terminal <args>


" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{
" Additional configuration in ~/.config/nvim/plugins/which_key.vim
nnoremap <Space>cc  :terminal

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}

