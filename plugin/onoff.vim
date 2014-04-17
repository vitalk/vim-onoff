" File: onoff.vim
" Author: Vital Kudzelka
" Description: Gracefully toggle boolean options in Vim.

" Guard {{{

if exists('g:loaded_onoff') || &cp || version < 700
  finish
endif
let g:loaded_onoff = 1

" }}}
" Public API {{{

command! -nargs=1 Onoff
      \ call onoff#toggle(<f-args>)

cabbr onoff Onoff

" }}}
