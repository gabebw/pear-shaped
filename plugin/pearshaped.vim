function! s:ClearMappings()
  mapclear
endfunction

function! s:ResetOptionsToDefaults()
  set all&
endfunction

" Add a user and source their vimrc
function! s:PearShaped(name)
  call s:ClearMappings()
  call s:ResetOptionsToDefaults()
endfunction

command! -nargs=1 PearShaped call s:PearShaped(<f-args>)
