autocmd TermOpen * set bufhidden=delete

" nnoremap <Leader>T :split <bar> terminal<CR>
let g:neoterm_autoscroll = '1'
let g:neoterm_autojump = '1'

let g:neoterm_automap_keys = '<F5>'
let g:neoterm_repl_ruby = 'pry'
let g:neoterm_default_mod = 'vertical'
let g:neoterm_statusline = 'Neoterm - shell'

command! -nargs=+ TT Topen | T <args>

" nnoremap <Space>;;  :TT
" vnoremap <Leader>;v :TREPLSendSelection<CR>
" nnoremap <Leader>;s :TREPLSendLine<CR>
" nnoremap <Leader>;f :TREPLSendFile<CR>
" nnoremap <Leader>;T :Ttoggle<CR>
" nnoremap <Leader>;q :Tclose<CR>
"
" Numbered Tclear commands. Ex., 3<Leader>;l will clear terminal 3
" nnoremap <leader>;l :<c-u>exec v:count.'Tclear'<cr>
