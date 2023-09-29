" Plugin:       vim-which-key
" Author:       liuchengxiu
" Repo:         https://github.com/liuchengxiu/vim-which-key
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      🌷 Vim plugin that shows keybindings in popup, similar to spacemacs

" Settings {{{

let g:mapleader = "\<Space>"

call which_key#register('<Space>', 'g:which_key_map')
let g:maplocalleader = ','

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=500

" Define prefix dictionary
let g:which_key_map =  { }

let g:which_key_map.d = { 
      \ 'name' : 'Documentation',
      \ 'd' : 'Search for term in Dash',
      \ }

let g:which_key_map.f = { 
      \ 'name' : 'Find',
      \ 'f' : 'Find files',
      \ 'g' : 'Live grep',
      \ 'b' : 'Search buffers',
      \ 'h' : 'Search help tags' 
      \ }

let g:which_key_map.g = {
      \ 'name' : 'Git',
      \ 'b' : ['Gblame'                , 'Git blame'],
      \ 'r' : ['GBrowse'               , 'Open repo on Github'],
      \ 'd' : ['GHDashboard'           , 'Show Github dashboard'],
      \ 'a' : ['GHActivity'            , 'Show Github activity'],
      \ }

let g:which_key_map.m = { 
      \ 'name' : 'Macros',
      \ 'l' : 'Append modeline',
      \ }

let g:which_key_map.n = {
      \ 'name' : 'Navigate',
      \ 'n' : 'Open file explorer',
      \ 'v' : 'Open Vista (method outliner)',
      \ 't' : 'Regenerate ctags',
      \ }

let g:which_key_map.o = {
      \ 'name' : 'Open',
      \ 'q' : 'Open quickfix list',
      \ 'l' : 'Open location list',
      \ }

let g:which_key_map.p = {
      \ 'name' : 'Plugins',
      \ 'g' : ['PlugUpgrade'                              , 'Upgrade vim-plug'],
      \ 'i' : ['PlugInstall'                              , 'Install plugins'],
      \ 'u' : ['PlugUpdate'                               , 'Update plugins'],
      \ 'p' : ['tabe ~/.config/nvim/rc/plugins.vim'       , 'Open plugins.vim'],
      \ }

let g:which_key_map.q = {
      \ 'name' : 'Quickfix',
      \ 'l' : ['ToggleQuickFix'     , 'Toggle quickfix list'],
      \ 'k' : ['call setqflist([])' , 'Clear quickfix list'],
      \ }

let g:which_key_map.r = {
      \ 'name' : 'Language-Specific Commands',
      \ 'f'    : 'Append frozen_string_literal line'
      \ }

let g:which_key_map.s = {
      \ 'name' : 'Settings',
      \ 'c' : 'Toggle crosshairs',
      \ 'n' : 'Toggle line numbers',
      \ 'r' : 'Toggle rainbow parentheses',
      \ 'p' : 'Toggle paste mode',
      \ 's' : 'Turn off scrolloff',
      \ }

let g:which_key_map.t = {
      \ 'name' : 'Tests',
      \ 'f' : ['TestFile'     , 'Run tests for file'],
      \ 's' : ['TestSuite'    , 'Run test suite'],
      \ 'n' : ['TestNearest'  , 'Run nearest test'],
      \ 'l' : ['TestLast'     , 'Run last test'],
      \ }


let g:which_key_map.v = {
      \ 'name' : 'Vim configs',
      \ 'i' : ['tabe ~/.config/nvim/init.vim'             , 'Open init.vim'],
      \ 'l' : ['tabe ~/.config/nvim/plugins/which_key.vim', 'Open leader key mappings'],
      \ 'm' : ['tabe ~/.config/nvim/rc/mappings.vim'      , 'Open mappings.vim'],
      \ 'M' : ['messages'                                 , 'Show messages'],
      \ 'p' : ['tabe ~/.config/nvim/rc/plugins.vim'       , 'Open plugins.vim'],
      \ }

let g:which_key_map.c = {
      \ 'name' : 'Terminal'
      \ }

" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{



" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{

" Hide the statusline, since it's repetitive
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" }}}

