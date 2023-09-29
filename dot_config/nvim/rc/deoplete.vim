"" Deoplete (Autocompletion plugin)
"" Invoked from: ~/.config/nvim/init.vim
"" Installed from: ~/.config/nvim/rc/plugins.vim

"" Settings {{{

"let g:deoplete#enable_at_startup = 1

"let g:deoplete#omni_patterns = {}
"let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"let g:deoplete#sources = {}
"let g:deoplete#sources._ = []
"let g:deoplete#file#enable_buffer_path = 1

"let g:minisnip_dir = '~/.config/nvim/snippets:~/.vim/minisnip'
"let g:minisnip_trigger = '<Shift-Tab>'

"let g:tmuxcomplete#trigger = ''

"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif

"" }}}

"" Mappings (~/.config/nvim/rc/mappings.vim) {{{

"" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"" Plugin key-mappings.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
""imap <expr><TAB>
"" \ pumvisible() ? "\<C-n>" :
"" \ neosnippet#expandable_or_jumpable() ?
"" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" }}}


