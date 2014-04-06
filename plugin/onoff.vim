" File: onoff.vim
" Author: Vital Kudzelka
" Description: Gracefully toggle boolean options in Vim.

" Guard {{{

if exists('g:loaded_onoff') || &cp || version < 700
  finish
endif
let g:loaded_onoff = 1

" }}}

nnore <Plug>(onoff-cursorline) :call onoff#toggle('cursorline')<cr>
nnore <Plug>(onoff-hlsearch) :call onoff#toggle('hlsearch')<cr>
nnore <Plug>(onoff-number) :call onoff#toggle('number')<cr>
nnore <Plug>(onoff-paste) :call onoff#toggle('paste')<cr>
nnore <Plug>(onoff-spell) :call onoff#toggle('spell')<cr>
nnore <Plug>(onoff-list) :call onoff#toggle('list')<cr>
