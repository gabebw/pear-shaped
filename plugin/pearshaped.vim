function! s:ClearMappings()
  mapclear
endfunction

function! s:ResetOptionsToDefaults()
  set all&
endfunction

" Add a user and source their vimrc
function! g:PearShaped(name)
  call s:ClearMappings()
  call s:ResetOptionsToDefaults()
endfunction
