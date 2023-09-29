" Plugin:       vim-github-dashboard
" Author:       junegunn
" Repo:         https://github.com/junegunn/vim-github-dashboard
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      :octocat: Browse GitHub events in Vim 
" Dependencies: requires Neovim ruby support

" Settings {{{

" Authenticate automatically
let g:github_dashboard = { 'username': 'dysnomian', 'password': $GITHUB_TOKEN }

" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

"        Primary mappings are in ~/.config/nvim/plugins/which_key.vim

" }}}
