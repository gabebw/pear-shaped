
if ! exists('g:pearshaped_directory')
  let g:pearshaped_directory = '~/.pearshaped'
endif

function! s:ClearMappings()
  mapclear
endfunction

function! s:ResetOptionsToDefaults()
  set all&
endfunction

function! s:SourceVimrc(name)
  let s:file = g:pearshaped_directory . '/' . a:name . "/vimrc"

  execute "source " s:file
endfunction

" Add a user and source their vimrc
function! s:PearShaped(name)
  call s:ClearMappings()
  call s:ResetOptionsToDefaults()
  call s:SourceVimrc(a:name)
endfunction

command! -nargs=1 PearShaped call s:PearShaped(<f-args>)
