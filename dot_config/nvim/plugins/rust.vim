" Plugin:       <PLUGIN>
" Author:       <AUTHOR>
" Repo:         https://github.com/<GITHUB_SLUG>
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      <SUMMARY>
" Dependencies: <DEPENDENCIES>

" Settings {{{

" Use mac pasteboard
  let g:rust_clip_command = 'pbcopy'

  " Autoformat on save
  let g:rustfmt_autosave = 1

" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

" nnoremap <silent> <leader>rf  :RustFmt<CR>
" nnoremap <silent> <leader>rt  :RustTest<CR>
" nnoremap <silent> <leader>rcb :CargoBuild<CR>

" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}

