" vim: set foldmethod=syntax:
" vim: set filetype=vim:
" vim: set fen fdm=marker vop-=folds tw=72 :

" Mappings {{{

nnoremap <silent> <leader>pi  :PlugInstall<CR>
nnoremap <silent> <leader>pc  :PlugClean<CR>
nnoremap <silent> <leader>ps  :PlugStatus<CR>
nnoremap <silent> <leader>pu  :PlugUpdate<CR>
nnoremap <silent> <leader>pU  :PlugUpgrade<CR>

" }}}


" Automatically install vim-plug if it's absent
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Note: This file will EXPLODE VIOLENTLY if loaded in regular vim, but it
" would be too difficult to sort out the neovim only plugins

" Install vim-plug bundles
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ryanoasis/vim-devicons'


"----------------------------------------------------------
"     Features
"---------------------------------------------------------- {{{

" Ctrl-P/Unite/Denite (~/.config/nvim/plugins/denite.vim) {{{
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/neomru.vim'   " most recently used source for denite

" Improved fuzzy matching for denite
" Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}

" }}}

" --------------------------------------------------------- }}}

" Treesitter (syntax tree based parsing library)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" nvim-telescope (fuzzy finder panel a la unite)
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'wellle/tmux-complete.vim'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'thinca/vim-ambicmd'

" File explorer
" Formatting (~/.config/nvim/rc/neoformat.vim) {{{

Plug 'sbdchd/neoformat', { 'do': 'pip3 install vim-vint' }
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'

" }}}

" Linting (~/.config/nvim/rc/linting.vim) {{{

Plug 'dense-analysis/ale'

" }}}

" Prose editing (~/.config/nvim/rc/prose.vim) {{{

" Plug 'rhysd/unite-redpen.vim'
Plug 'junegunn/goyo.vim'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'reedes/vim-pencil'
Plug 'ujihisa/neco-look', { 'for': ['text', 'note', 'gitcommit', 'markdown'] }

" }}}




" Test Runner (~/.config/nvim/rc/test.vim) {{{

Plug 'janko/vim-test'
Plug 'benmills/vimux'
Plug 'thinca/vim-quickrun'

" }}}



" Document outlining with LSP support (~/.config/nvim/plugins/vista.vim) {{{

Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" }}}



" Motions {{{

Plug 'tpope/vim-surround'       " Surround a word or motion with brackets
Plug 'tpope/vim-repeat'         " Repeat . commands

" }}}



" Tmux compatibility {{{

Plug 'christoomey/vim-tmux-navigator'

" }}}



" Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/neco-syntax'
Plug 'chrisbra/Colorizer'
Plug 'emilyst/vim-xray'                  " Show invisibles when you want to see them
Plug 'mhinz/vim-grepper'                 " flexible grep w/quicklist
Plug 'tpope/vim-rsi'                     " readline key bindings
Plug 'tpope/vim-endwise'                 " automatically add `end`
Plug 'tpope/vim-projectionist'           " project layout
Plug 'tpope/vim-commentary'              " comment a line with //
Plug 'tpope/vim-eunuch'                  " unix commands
Plug 'tpope/vim-abolish'                 " find and change word variants
Plug 'junegunn/rainbow_parentheses.vim', " rainbow parentheses

" Plug 'severin-lemaignan/vim-minimap' " VSCode style minimaps
Plug 'dbakker/vim-projectroot'

" Documentation {{{

Plug 'rizzatti/dash.vim'

" }}}

"----------------------------------------------------------
"     Mappings
"---------------------------------------------------------- {{{
"
" Vim-which-key, leader key help (~/.config/nvim/plugins/which_key.vim) {{{

Plug 'liuchengxu/vim-which-key'

" }}}



"----------------------------------------------------------
"     Language-Specific Support
"---------------------------------------------------------- {{{

" Ansible {{{

Plug 'pearofducks/ansible-vim'

" }}}

" Arduino {{{

Plug 'stevearc/vim-arduino'

" }}}

" Clojure (~/.config/nvim/rc/lisps.vim) {{{
Plug 'tpope/vim-salve',                  { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',              { 'for': 'clojure' }

" }}}

" Docker {{{

Plug 'docker/docker'
Plug 'ekalinin/Dockerfile.vim'

" }}}

" Elm {{{

Plug 'ElmCast/elm-vim'

" }}}

" Elixir {{{

Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir', {'for': 'elixir' }

" }}}

" Elvish {{{

Plug 'dmix/elvish.vim'

" }}}

" Git (~/.config/nvim/rc/git.vim) {{{

Plug 'junegunn/vim-github-dashboard'
Plug 'lambdalisue/vim-gista'
Plug 'rhysd/committia.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-rhubarb'

" }}}

" Go {{{

Plug 'fatih/vim-go', { 'for': 'go' }

" }}}

" Groovy {{{

Plug 'vim-scripts/groovy.vim', { 'for': 'groovy' }

" }}}

" Java {{{

Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }

" }}}

" Javascript {{{

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'posva/vim-vue', { 'for': ['vue'] }

" }}}

" Nginx {{{

Plug 'chr4/nginx.vim'

" }}}

" Ruby ~/.config/nvim/rc/ruby.vim {{{

Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'coffee', 'javascript'] }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'cristianbica/neomake-rspec', { 'for': 'ruby' }
Plug 'noprompt/vim-yardoc'

" }}}

" Rust {{{

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

" }}}

" Shell {{{

Plug 'chrisbra/vim-zsh'
Plug 'dag/vim-fish'

" }}}

" Swift {{{

Plug 'keith/swift.vim'

" }}}
"
" Terraform {{{
" Additional configuration: ~/.config/nvim/rc/terraform.vim
Plug 'hashivim/vim-terraform'
" Plug 'godlygeek/tabular'
" }}}

" TeX {{{
" ~/.config/nvim/plugins/vimtex.vim
Plug 'lervag/vimtex'
Plug 'fannheyward/coc-texlab'
" }}}

" Tmux {{{
Plug 'tmux-plugins/vim-tmux'
" }}}

" Yaml {{{

Plug 'stephpy/vim-yaml'

" }}}
"

" ------------------------------------------------------ }}}



Plug 'aserebryakov/vim-todo-lists'
Plug 'junegunn/vim-emoji'
Plug 'Shougo/neco-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/neossh.vim'

" C-p fuzzy find with fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dysnomian/vim-pureillusion'
Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'

call plug#end()

let g:XkbSwitchEnabled = 1
" vim: set ts=8 sw=2 tw=72 noet fdm=marker foldlevel=1:
