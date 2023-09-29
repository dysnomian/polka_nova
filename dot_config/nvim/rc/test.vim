nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>

let test#strategy = {
  \ 'nearest': 'vimux',
  \ 'file':    'vimux',
  \ 'suite':   'vimux',
  \}

let test#neovim#term_position = "vertical"

let g:VimuxRunnerType = "window"
let g:VimuxUseNearest = 1

let test#enabled_runners = [
			\ 'elixir#exunit',
			\ 'ruby#rspec',
			\ 'ruby#minitest',
			\ 'clojure#fireplacetest',
			\ 'vimscript#themis',
			\ 'rust#cargotest',
			\ 'elm#elmtest',
			\ 'go#gotest',
			\ ]

" The built-in mapping for exiting terminal insert mode is CTRL-\ CTRL-n,
" which is difficult to press, remap it to CTRL-o
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" Autorun tests when defined
augroup test
  autocmd!
  autocmd BufWrite * if test#exists() |
    \   TestFile |
    \ endif
augroup END
