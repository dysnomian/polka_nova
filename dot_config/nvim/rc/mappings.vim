" Leader Key {{{
" See also ~/.config/nvim/plugins/which_key.vim for the leader key hint plugin

" }}}

let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" By default timeoutlen is 1000 ms
set timeoutlen=500

" Open quickfix list
nnoremap <silent> <leader>oq  :copen<CR>

" Open location list
nnoremap <silent> <leader>ol  :lopen<CR>

nnoremap <silent> <leader>vi  :tabe ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>vp  :tabe ~/.config/nvim/rc/plugins.vim<CR>
nnoremap <silent> <leader>vl  :tabe ~/.config/nvim/plugins/which_key.vim<CR>
nnoremap <silent> <leader>vm  :tabe ~/.config/nvim/rc/mappings.vim<CR>

" }}}
"
"" Quick buffer switching {{{

function SwitchBuffer()
  b#
endfunction

nmap <Space><Space> :call SwitchBuffer()<CR>

" }}}

" regenerate CTAGS with ripper-tags
map <Leader>nt :silent !ctags -R --exclude=vendor<CR>

" Rubocop fix current file
nmap <leader>rc :call RubocopAutoFix()<CR>

map // :Commentary<CR>

" Toggle crosshairs
map <Leader>sc :set cursorline! cursorcolumn!<cr>

" Toggle line numbers
map <Leader>sn :set nu!<cr>

" Toggle paste mode
map <Leader>sp :set paste!<cr>

" Turn off extra lines above and below current line
map <Leader>ss :set scrolloff=0<cr>

" Toggle rainbow parens
map <Leader>sr :RainbowParentheses!!<cr>

" Function: Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

