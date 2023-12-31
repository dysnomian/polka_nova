" Plugin:       <PLUGIN>
" Author:       Yggdroot
" Repo:         https://github.com/Yggdroot/indentLine
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      A vim plugin to display the indention levels with thin vertical lines

" Settings {{{

" Change Character Color
" ======================
"
" indentLine will overwrite 'conceal' color with grey by default. If you want 
" to highlight conceal color with your colorscheme, disable by:
"     let g:indentLine_setColors = 0
"
" Or you can use the same colors as another highlight group. To use the same 
" colors that are used for tab indents, use the 'SpecialKey' group:
"     let g:indentLine_defaultGroup = 'SpecialKey'

" Or you can customize conceal color by:
"     Vim
"     let g:indentLine_color_term = 239
"
"     GVim
"     let g:indentLine_color_gui = '#A4E57E'
"
"     none X terminal
"     let g:indentLine_color_tty_light = 7 " (default: 4)
"     let g:indentLine_color_dark = 1 " (default: 2)
"
"     Background (Vim, GVim)
"     let g:indentLine_bgcolor_term = 202
"     let g:indentLine_bgcolor_gui = '#FF5F00'
" 
"
"
" Change Indent Char
" ==================
" 
"     Vim and GVim
"     let g:indentLine_char = 'c'
" 
" where 'c' can be any ASCII character. You can also use one of 
" ¦, ┆, │, ⎸, or ▏ to display more beautiful lines. However, these 
" characters will only work with files whose encoding is UTF-8.
" 
" or
" 
"     let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" 
" each indent level has a distinct character.
" 
"
"
" Change Conceal Behaviour
" ========================
" 
" This plugin enables the Vim conceal feature which automatically hides 
" stretches of text based on syntax highlighting. This setting will apply to 
" all syntax items.
" 
" For example, users utilizing the built in json.vim syntax file will no longer 
" see quotation marks in their JSON files.
" 
" indentLine will overwrite your "concealcursor" and "conceallevel" with 
" default value:
" 
"     let g:indentLine_concealcursor = 'inc'
"     let g:indentLine_conceallevel = 2
" 
" You can customize these settings, but the plugin will not function if 
" conceallevel is not set to 1 or 2.
" 
" If you want to keep your conceal setting, put this line to your vim dotfile:
" 
"     let g:indentLine_setConceal = 0
" 
" See the VIM Reference Manual for more information on the conceal feature.
" 
"
"
" Disable by default
" ==================

let g:indentLine_enabled = 0

" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

map <Leader>si :IndentLinesToggle<cr>

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}

