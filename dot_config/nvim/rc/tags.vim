" Tags
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

" }}}

" Settings {{{

let g:neotags_recursive = 1

" Use this option for the_silver_searcher
let g:neotags_find_tool = 'ag -g ""'

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{

" }}}
"
" Functions
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
