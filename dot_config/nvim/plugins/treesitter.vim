" Plugin:       nvim-treesitter
" Author:       nvim-treesitter
" Repo:         https://github.com/nvim-treesitter/nvim-treesitter
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      Nvim Treesitter configurations and abstraction layer 

" Initialization

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "ruby" },  -- list of language that will be disabled
  },
}
EOF

" Settings {{{



" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{



" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}
