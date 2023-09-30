" vim: set foldmethod=syntax:
" vim: set filetype=vim:

" 1 important ============================================================= {{{
if &compatible
  set nocompatible
endif

function! s:source_rc(path, ...) abort "{{{
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/.config/nvim/rc/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction "}}}

" Function: plugin_config {{{
" Sources config for a specified plugin.
" See also: ~/.config/nvim/plugins
" 
"
function! s:plugin_config(path, ...) abort
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/.config/nvim/plugins/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction "}}}

function! s:feature_config(path, ...) abort
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/.config/nvim/features/' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction "}}}

" Function: open configuration for named plugin
function! ConfigurePlugin(plugin_name)
    execute 'tabe '.fnameescape(expand('~/.config/nvim/plugins/' . a:plugin_name . '.vim'))
endfunction

call s:source_rc('filetype.vim')
call s:source_rc('plugins.vim')

" ========================================================================= }}}
" 2 moving around, searching and patterns ================================= {{{
set exrc

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Ignore case of searches
set ignorecase
set smartcase

" Add the g flag to search/replace by default
set gdefault

" Highlight dynamically as pattern is typed
set incsearch
set showmatch

" Use smartcase for command mode
" assumes set ignorecase smartcase
augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
augroup END

" Jump to last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" ========================================================================= }}}
" 3 tags ================================================================== {{{
" ========================================================================= }}}
" 4 displaying text ======================================================= {{{

" Show tab characters and trailing whitespace
set list
set list listchars=tab:»·,trail:·

" Enable line numbers
" set number

" Start scrolling three lines before the horizontal window border
set scrolloff=5

" ========================================================================= }}}
" 5 syntax, highlighting and spelling ===================================== {{{

set background=dark
colorscheme monokai_pro

" Enable syntax highlighting
syntax on

" Highlight searches
set hlsearch

" stop syntax highlighting this many columns out
set synmaxcol=300  

" Set true colors if the terminal supports it
if has('nvim') || has('termguicolors')
  set termguicolors
endif

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Highlight current line
" set cursorline

" Show a vertical line/guard at column 80
" let &colorcolumn=join(range(81,999),',')
" highlight ColorColumn ctermbg=235 guibg=#FFACBF
" let &colorcolumn="80,".join(range(400,999),',')

" ========================================================================= }}}
" 6 multiple windows ====================================================== {{{

" Always show status line
set laststatus=2

" do the splits! DO THE SPLITS!
" (make vim splits work the way you'd think)
set splitbelow
set splitright

" Show the filename in the window titlebar
set title
" ========================================================================= }}}
" 9 using the mouse ======================================================= {{{

" Enable mouse in all modes
set mouse=a

" ========================================================================= }}}
" 10 GUI ================================================================== {{{
" ========================================================================= }}}
" 11 printing ============================================================= {{{
" ========================================================================= }}}
" 12 messages and info ==================================================== {{{

" unnecessary with lightline
set noshowmode
" Show the cursor position
set ruler
" Show the (partial) command as it’s being typed
set showcmd
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Disable error bells
set noerrorbells

" ========================================================================= }}}
" 13 selecting text ======================================================= {{{

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" ========================================================================= }}}
" 14 editing text ========================================================= {{{

" Allow backspace in insert mode
set backspace=indent,eol,start

" ========================================================================= }}}
" 15 tabs and indenting =================================================== {{{

" Indentation
set shiftwidth=2
set expandtab
set autoindent smartindent
set softtabstop=2
set shiftround

" ========================================================================= }}}
" 16 folding ============================================================== {{{

set foldenable
set foldlevel=99      " Don't autofold anything
set foldlevelstart=99 " Don't autofold anything
set foldmethod=manual " allows faster editing by default

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &foldcolumn + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(' ',fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" ========================================================================= }}}
" 17 diff mode ============================================================ {{{
" ========================================================================= }}}
" 18 mapping ============================================================== {{{
" See file at ~/.config/nvim/rc/mappings.vim

call s:source_rc('mappings.vim')

" ========================================================================= }}}
" 18 mapping ============================================================== {{{

" Don’t add empty newlines at the end of files
set binary
set noendofline

" ========================================================================= }}}
" 19 reading and writing files ============================================ {{{

" Respect modeline in files
set modeline
set modelines=4

" ========================================================================= }}}
" 20 the swap file ======================================================== {{{
" ========================================================================= }}}
" 21 command line editing ================================================= {{{

" Enhance command-line completion
set wildmenu

" ========================================================================= }}}
" 22 executing external commands ========================================== {{{
" ========================================================================= }}}
" 23 running make and jumping to errors =================================== {{{
" ========================================================================= }}}
" 24 language specific ==================================================== {{{

call s:source_rc('ruby.vim')

" Plugin specific settings
call s:source_rc('pencil.vim')

let g:python_host_prog  = '/usr/local/opt/python@2/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" ========================================================================= }}}
" 25 multi-byte characters ================================================ {{{

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" ========================================================================= }}}
" 26 various ============================================================== {{{
" ========================================================================= }}}

" Automatic commands
" See also: ~/.config/nvim/rc/filetype.vim
if has('autocmd')
    " Enable file type detection
    filetype on
    " Treat .json files as .js
    autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    " Treat .md files as Markdown
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" plugins ================================================================= {{{

""" Plugin Configuration

call s:source_rc('chezmoi.vim')
call s:plugin_config('coc.vim')
call s:source_rc('easy_align.vim')
call s:source_rc('emoji.vim')
call s:source_rc('file_explorer.vim')
call s:source_rc('goyo.vim')
call s:source_rc('highlighter.vim')
call s:source_rc('linting.vim')
call s:source_rc('lisps.vim')
call s:plugin_config('vimtex.vim')
call s:source_rc('neoformat.vim')
" call s:source_rc('neoterm.vim')
call s:source_rc('prose.vim')
call s:source_rc('quickfix.vim')
call s:source_rc('rust.vim')
call s:source_rc('search.vim')
call s:source_rc('tags.vim')
call s:source_rc('tern.vim')
call s:source_rc('test.vim')

if has('python3')
  " call s:plugin_config('arduino.vim')
  call s:plugin_config('fzf.vim')
  call s:plugin_config('git_messenger.vim')
  call s:plugin_config('indentline.vim')
  call s:plugin_config('lightline.vim')
  call s:plugin_config('rust.vim')
  call s:plugin_config('test_plugin.vim')
  call s:plugin_config('telescope.vim')
  call s:plugin_config('treesitter.vim')
  call s:plugin_config('vista.vim')
  call s:plugin_config('which_key.vim')
endif

" call s:feature_config('append_modeline.vim')
call s:feature_config('autocomplete.vim')
call s:feature_config('documentation.vim')
call s:feature_config('feature_and_plugin_skeletons.vim')
call s:feature_config('tabs_and_sessions.vim')
call s:feature_config('tabline.vim')
call s:feature_config('terminal.vim')

" Custom highlights
hi ALEErrorSign   guifg=#3981f1
hi ALEWarningSign guifg=#fcfdaf
hi Conditional    term=bold        cterm=bold        gui=bold
hi Define         term=bold        cterm=bold        gui=bold
hi MsgArea        guibg=#222222
hi Search         guifg=#000000    guibg=#e69263


" Set cursorline only in current buffer
" augroup CursorLine
"     au!
"     au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"     au WinLeave * setlocal nocursorline
" augroup END

set cmdheight=1

" ========================================================================= }}}

if has('nvim') || has('gui_running')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2
endif

" }}}

"" vim: set fen fdm=marker vop-=folds ft=vim tw=72 foldenable:
