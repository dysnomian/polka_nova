" File Explorer plugin settings
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Settings {{{

""" Autocommands {{{
""" }}}



function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <cr>
	  \ defx#do_action('drop')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> <C-n>
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 2
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }

" }}}

" Highlighting {{{

" hi Defx_git_Untracked guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
" hi Defx_git_Ignored guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
" hi Defx_git_Unknown guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE
" hi Defx_git_Renamed ctermfg=214 guifg=#fabd2f
" hi Defx_git_Modified ctermfg=214 guifg=#fabd2f
" hi Defx_git_Unmerged ctermfg=167 guifg=#fb4934
" hi Defx_git_Deleted ctermfg=167 guifg=#fb4934
" hi Defx_git_Staged ctermfg=142 guifg=#b8bb26

" hi RedBg guifg=#000000 guibg=#fa9cb6
" au TermOpen * :set winhighlight=Normal:RedBg
hi BlackBg guibg=black
au TermOpen * :set winhighlight=Normal:BlackBg
au BufHidden term://* :set winhighlight=Normal:Normal

" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

nnoremap <buffer><silent> <C-n> :Defx -split=vertical -winwidth=30 -direction=topleft 
      \ `expand('%:p:h')` -search=`expand('%:p')` 
      \ -buffer-name=defx -columns=indent:icon:filename:git
      \ -toggle<CR>
nnoremap <buffer><silent> [c <Plug>(defx-git-prev)
nnoremap <buffer><silent> ]c <Plug>(defx-git-next)

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{

autocmd FileType defx call s:defx_my_settings()

" }}}
