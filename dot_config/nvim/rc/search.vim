" View TODO commments, etc in Quickfix 
command! ListTodos :Grepper
      \ -noprompt
      \ -tool git
      \ -grepprg git grep -nI '\(TODO\|FIXME\|OPTIMIZE\)'

nnoremap <leader>T :ListTodos<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ack silent! grep! <args>|cwindow|redraw!
nnoremap \ :GrepperAg<SPACE>

" bind K to grep word under cursor
nnoremap K :GrepperAg "\b<C-R><C-W>\b"<CR>:cw<CR>
