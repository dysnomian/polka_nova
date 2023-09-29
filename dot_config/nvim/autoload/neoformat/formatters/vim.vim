function! neoformat#formatters#vim#enabled() abort
    return ['vint']
endfunction

function! neoformat#formatters#vim#vint() abort
    return {
					\'exe': 'vint',
					\ 'args': '--enable-neovim',
					\ 'stdin': 1
					\}
endfunction
