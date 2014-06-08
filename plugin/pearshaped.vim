" Can only have 2 users
" Should be able to delete users, so we don't have to register in a particular
" order so we pop the user stack correctly

" On switch, clears everything and loads vimrc
" Maybe can specify vimrc on github? - too complicated, need to clone down
" dotfiles and source the vimrc there. But that's possible...eh.
" Let users clone it down themselves and provide a path to it. MVP BITCHES

let g:pearshaped_current_user  = ""
let g:pearshaped_previous_user = ""

function! s:ClearMappings()
  mapclear
endfunction

function! s:ResetOptionsToDefaults()
  set all&
endfunction

function! s:AllVariables()
  let all_variables_and_values = ""
  redir => all_variables_and_values
  silent let
  redir END

  let lines = split(all_variables_and_values, "\n")
  let only_variable_names = map(lines, 'split(v:val, " ")[0]')

  return only_variable_names
endfunction

function! s:UnsetAllVariables()
  for variable in s:AllVariables()
    if variable !~ "^[bv]:" && variable !~ "pearshaped"
      " Don't unlet 'b:' or 'v:' variables
      if variable =~ "^.:"
        " Has a prefix of some sort
        execute "unlet!" variable
      else
        " Add 'g:' prefix
        execute "unlet!" "g:".variable
      endif
    endif
  endfor
endfunction

function! s:PearSource()
  call s:PearReset()
  execute "source" "~/.pear-shaped/" . g:pearshaped_current_user . "-vimrc"
endfunction

function! s:PearReset()
  call s:ClearMappings()
  call s:ResetOptionsToDefaults()
  call s:UnsetAllVariables()
endfunction

" Add a user and source their vimrc
function! g:PearShaped(name)
  call s:ClearMappings()
  call s:ResetOptionsToDefaults()
endfunction
