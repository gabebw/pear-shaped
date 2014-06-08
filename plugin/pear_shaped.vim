if ! exists('g:pear_shaped_directory')
  let g:pear_shaped_directory = '~/.pear_shaped'
endif

function! s:ClearMappings()
  mapclear
endfunction

function! s:ResetOptionsToDefaults()
  set all&
endfunction

function! s:SourceVimrc(name)
  let s:file = g:pear_shaped_directory . '/' . a:name . "/vimrc"

  execute "source " s:file
endfunction

" Add a user and source their vimrc
function! s:PearShaped(name)
  let s:current_user = a:name

  call s:ClearMappings()
  call s:ResetOptionsToDefaults()
  call s:SourceVimrc(a:name)
endfunction

function! s:PearAdd(name)
  if len(s:users) < 2
    call add(s:users, a:name)
    call s:PearShaped(a:name)
  else
    echoerr "[PearShaped] Cannot add more than two users with :PearAdd, try :PearClearUsers first"
  endif
endfunction

function! s:PearSwap()
  let other_user = ""
  if s:users[0] ==# s:current_user
    let other_user = s:users[1]
  else
    let other_user = s:users[0]
  endif

  call s:PearShaped(other_user)
endfunction

function! s:PearClearUsers()
  let s:users = []
  let s:current_user = ""
endfunction

command! -nargs=1 PearShaped call s:PearShaped(<f-args>)
command! -nargs=1 PearAdd call s:PearAdd(<f-args>)
command! PearSwap call s:PearSwap()
command! PearClearUsers call s:PearClearUsers()

PearClearUsers
