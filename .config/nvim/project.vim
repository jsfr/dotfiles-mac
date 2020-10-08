" Change directory to project root
function! <SID>AutoProjectRootCD()
  try
    if &ft != 'help'
      ProjectRootCD
    endif
  catch
    " ignore
  endtry
endfunction

autocmd BufEnter * call <SID>AutoProjectRootCD()

