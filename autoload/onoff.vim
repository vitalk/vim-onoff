" File: onoff.vim
" Author: Vital Kudzelka
" Description: Gracefully toggle boolean options in Vim.

" Echoes message {{{

fun! onoff#echo(expr)
  echo a:expr
endf

" }}}
" Toggle option state and echo them {{{

fun! onoff#toggle(option)
  exe 'set ' . a:option . '!'
  exe 'let enabled = &' . a:option
  if enabled
    call onoff#echo(a:option . ' on')
  else
    call onoff#echo(a:option . ' off')
  endif
endf

" }}}
