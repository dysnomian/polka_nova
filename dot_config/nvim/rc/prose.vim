" Configuration for reedes/vim-pencil, among other things.
"
" https://github.com/reedes/vim-pencil
"
" Configuration for files where writing prose is a primary consideration. This
" includes Markdown, text files, TeX, and org mode files.
let g:pencil#textwidth = 74

function! Prose()
  call pencil#init()
  " replace common punctuation
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »

  " open most folds
  setlocal foldlevel=6
endfunction
" automatically initialize buffer by file type
autocmd FileType markdown,mkd,text,txt call Prose()

" invoke manually by command for other file types
command! -nargs=0 Prose call Prose()
