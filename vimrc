" ~/.vimrc (symlinked from mac-setup)

" UI
set number
" set relativenumber

" Enable syntax highlighting and filetype detection/plugins
syntax on
filetype plugin indent on

" Verilog/SystemVerilog filetypes
augroup verilog_ft
  autocmd!
  autocmd BufNewFile,BufRead *.v,*.vh   set filetype=verilog
  autocmd BufNewFile,BufRead *.sv,*.svh set filetype=systemverilog
augroup END
