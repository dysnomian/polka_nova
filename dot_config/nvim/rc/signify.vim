let g:signify_vcs_cmds = { 'git':'git diff --no-color --no-ext-diff -U0 -- %f' }

" Emoji {{{
let g:signify_sign_add = emoji#for('small_blue_diamond')
let g:signify_sign_delete = emoji#for('small_red_triangle')
let g:signify_sign_delete_first_line = g:signify_sign_delete
let g:signify_sign_change = emoji#for('small_orange_diamond')
let g:signify_sign_changedelete = emoji#for('collision')
