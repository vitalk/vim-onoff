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
" Read file content line by line {{{

fun! s:readfile(fname)
  let fname = fnameescape(a:fname)
  if filereadable(fname)
    return readfile(fname)
  endif
  return []
endf

" }}}
" Autocompletion {{{

fun! s:complist()
  let complist = []
  let pattern = '\*''no\(\w\+\)'''
  for line in s:readfile($VIMRUNTIME . '/doc/options.txt')
    let value = matchstr(line, pattern)
    if !empty(value)
      call add(complist, substitute(value, pattern, '\1', ''))
    endif
  endfor
  return sort(complist)
endf

fun! onoff#compfunc(...)
  " Cache completion list on first call for later reuse
  if !exists('s:cache')
    let s:cache = join(s:complist(), "\n")
  endif
  return s:cache
endf

" }}}
