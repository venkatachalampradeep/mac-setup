set nocompatible          " use modern Vim defaults

" ~/.vimrc (symlinked from mac-setup)

" UI
set number
set relativenumber

" indentation
set expandtab           " always insert spaces
set tabstop=3           " a tab character looks like 3 spaces
set shiftwidth=3        " auto-indent steps are 3 spaces
set softtabstop=3       " <Tab>/<BS> feel like 3 spaces
set autoindent
set smartindent

" Enable syntax highlighting and filetype detection/plugins
syntax on
filetype plugin indent on

" Verilog/SystemVerilog filetypes
augroup verilog_ft
  autocmd!
  autocmd BufNewFile,BufRead *.v,*.vh   set filetype=verilog
  autocmd BufNewFile,BufRead *.sv,*.svh set filetype=systemverilog
augroup END
