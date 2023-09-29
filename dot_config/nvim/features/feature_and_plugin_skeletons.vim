" Feature and plugin skeletons configuration
"
" Invoked from: ~/.config/nvim/init.vim
" Installed from: ~/.config/nvim/rc/plugins.vim

" Autocommands {{{
augroup templates
  autocmd BufNewFile */nvim/features/*.vim 0r ~/.config/nvim/templates/feature_config.vim
  autocmd BufNewFile */nvim/plugins/*.vim 0r ~/.config/nvim/templates/plugin_config.vim
augroup END

" }}}

" Settings {{{



" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{



" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}
