" Template settings
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Settings {{{
" }}}

" Highlighting {{{
" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{
" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
    autocmd BufNewFile *.rb 0r ~/.config/nvim/templates/skeleton.rb
    autocmd BufNewFile *_spec.rb 0r ~/.config/nvim/templates/rspec.rb
    autocmd BufNewFile ~/.config/nvim/rc/*.vim 0r ~/.config/nvim/templates/vim_configs.vim
  augroup END
endif

" }}}
