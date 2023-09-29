" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

augroup syntaxfolding
  autocmd!
  autocmd FileType vimscript  setlocal foldmethod=syntax
  autocmd FileType vim        setlocal foldmethod=syntax
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd FileType python     setlocal foldmethod=syntax
augroup end

autocmd BufRead,BufNewFile Dockerfile* setf Dockerfile
