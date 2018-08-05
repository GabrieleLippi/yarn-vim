" ya.vim: simple wrapper around yarn package manager
" Version: 0.1
" Maintainer: Gabriele Lippi<gabriele@lippi.net>
" Last modified: 05/08/2018
" License: This script is released under the Vim License.

if exists("ya")
  finish "stop loading the script
endif
let ya=1

let w:packages = ""

" store current compatible-mode in local variable
let s:global_cpo = &cpo
" go into nocompatible-mode
set cpo&vim 

function s:getPackages(packages)
  if (len(a:packages) > 1)
    let w:packages = join(a:packages[0:], ' ')
  else
    let w:packages = a:packages[0]
  endif
endfunction

function! Ya(...)
  call s:getPackages(a:000[0:])
  let cmd = "yarn add " . w:packages
  execute "!" . cmd
endfunction

" add to devDependencies
function! Yad(...)
  let package = ''
  if (len(a:000) > 1)
    let package = join(a:000[0:], ' ')
  else
    let package = a:000[0]
  endif
  let cmd = "yarn add --dev " . package
  execute "!" . cmd
endfunction

" add to peerDependencies
function! Yad(...)
  let package = ''
  if (len(a:000) > 1)
    let package = join(a:000[0:], ' ')
  else
    let package = a:000[0]
  endif
  let cmd = "yarn add --peer " . package
  execute "!" . cmd
endfunction


" add to optionalDependencies
function! Yao(...)
  let package = ''
  if (len(a:000) > 1)
    let package = join(a:000[0:], ' ')
  else
    let package = a:000[0]
  endif
  let cmd = "yarn add --optional " . package
  execute "!" . cmd
endfunction

" upgrade a dependecy
function! Yu(...)
  let package = ''
  if (len(a:000) > 1)
    let package = join(a:000[0:], ' ')
  else
    let package = a:000[0]
  endif
  let cmd = "yarn upgrade " . package
  execute "!" . cmd
endfunction


" remove a dependecy
function! Yu(...)
  let package = ''
  if (len(a:000) > 1)
    let package = join(a:000[0:], ' ')
  else
    let package = a:000[0]
  endif
  let cmd = "yarn remove" . package
  execute "!" . cmd
endfunction

command! -nargs=* Ya :call Ya(<f-args>)
