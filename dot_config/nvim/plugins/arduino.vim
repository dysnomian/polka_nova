" Plugin:       vim-arduino
" Author:       stevearc
" Repo:         https://github.com/stevearc/vim-arduino
" Invocation:   ~/.config/nvim/init.vim
" Installation: ~/.config/nvim/rc/plugins.vim
" Summary:      Vim plugin for compiling and uploading arduino sketches 

" Settings {{{

" function! MyStatusLine()
"   let port = arduino#GetPort()
"   let line = '%f [' . g:arduino_board . '] [' . g:arduino_programmer . ']'
"   if !empty(port)
"     let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
"   endif
"   return line
" endfunction
" setl statusline=%!MyStatusLine()
" }}}

" Highlighting {{{



" }}}

" Mappings (see also: ~/.config/nvim/rc/mappings.vim) {{{

nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>


" }}}

" Filetypes (see also: ~/.config/nvim/rc/filetype.vim {{{



" }}}

