" Plugin:       Lightline
" Author:       itchyny
" Repo:         https://github.com/itchyny/lightline.vim
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      A light and configurable statusline/tabline plugin for Vim

" Settings {{{

" Always show tabline
set showtabline=2

" Remove extra status line
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'pureillusion',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'project', 'gitbranch', 'readonly', 'filename' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [],
      \             [ 'readonly', 'project', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'project': 'LightlineProjectName',
      \   'filename': 'LightlineFilename',
      \   'readonly': 'LightlineReadonly',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \  },
      \ 'tab_component_function': {
      \   'cwd': 'LightlineCurrentDirectory',
      \   'filename': 'LightlineTabFilename',
      \  }
      \ }

function! LightlineFileformat()
  return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 90 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! LightlineCurrentDirectory(n) abort
  return fnamemodify(getcwd(tabpagewinnr(a:n), a:n), ':t')
endfunction

function! LightlineProjectName()
  let project = fnamemodify(fnamemodify(get(b:, 'git_dir'), ':h'), ':t')
  return project !=# '0' ? project : ''
endfunction

" function! LightlineTabProjectName(n) abort
"   let projectname = fnamemodify(fnamemodify(get(b:, 'git_dir'), ':h'), ':t')
"   return projectname
" endfunction
" function! LightlineTabProjectName(n) abort
"   let root = fnamemodify(get(b:, 'git_dir'), ':h')
"   let buflist = tabpagebuflist(a:n)
"   let winnr = tabpagewinnr(a:n)
"   let _ = winnr
"   " let _ = expand('#'.buflist[winnr - 1].':t')
"   return _ !=# '' ? _ : '[No Name]'
" endfunction

" Don't show read only in help, vimfiler, unite, etc
function! LightlineReadonly()
  return &readonly && &filetype !~# '\v(help|vimfiler|unite)' ? 'RO' : ''
endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':t')
  return _ !=# '' ? _ : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
" let g:lightline.component_expand = {
"       \  'linter_checking': 'lightline#ale#checking',
"       \  'linter_warnings': 'lightline#ale#warnings',
"       \  'linter_errors': 'lightline#ale#errors',
"       \  'linter_ok': 'lightline#ale#ok',
"       \ }

" let g:lightline.component_type = {
"       \     'linter_checking': 'left',
"       \     'linter_warnings': 'warning',
"       \     'linter_errors': 'error',
"       \     'linter_ok': 'left',
"       \ }

" let g:lightline.component_function = { 'component_function': {
"       \ 'method': 'NearestMethodOrFunction',
"       \ 'gitbranch': 'FugitiveHead'
"       \} }

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}

" vim: set ts=8 sw=2 tw=78 noet :
