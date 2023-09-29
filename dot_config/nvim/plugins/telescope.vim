" Plugin:       telescope.nvim
" Author:       nvim-telescope
" Repo:         https://github.com/nvim-telescope/telescope.nvim
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      Fuzzy finder for lists
" Dependencies: Neovim, lua, nvim-treesitter, plenary, popup

" Settings {{{

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fv <cmd>lua require('telescope.builtin').live_grep()<cr>

" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{



" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}
