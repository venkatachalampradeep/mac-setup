" init.vim — clean baseline configuration

" -----------------------------
" Core editor behavior
" -----------------------------
set nocompatible
set number
set autoread
au CursorHold * checktime
set relativenumber
set hidden
set mouse=a
set updatetime=300
set signcolumn=yes
set termguicolors
set showmode
set clipboard=unnamedplus

" Tabs and indentation
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent

" Searching
set ignorecase
set smartcase
set incsearch
set hlsearch

" UI polish
set cursorline
set wrap
set linebreak

syntax on
filetype plugin indent on

" -----------------------------
" Plugin manager (vim-plug)
" -----------------------------
call plug#begin('~/.local/share/nvim/plugged')

" Appearance
Plug 'morhetz/gruvbox'

" Navigation / fuzzy find
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'

" Treesitter (syntax, parsing)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP and completion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Diagnostics / formatting
Plug 'dense-analysis/ale'

call plug#end()

" -----------------------------
" Colorscheme
" -----------------------------
set background=dark
colorscheme gruvbox

" -----------------------------
" Treesitter config
" -----------------------------
lua <<EOF
local ok, tsconfigs = pcall(require, "nvim-treesitter.configs")
if ok then
  tsconfigs.setup {
    ensure_installed = { "lua", "vim", "python", "javascript", "typescript", "go", "json", "yaml", "bash" },
    highlight = { enable = true },
    indent = { enable = true },
  }
end
EOF

" -----------------------------
" ALE (lint/fix)
" -----------------------------
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" -----------------------------
" LSP + completion (nvim-cmp)
" -----------------------------
lua <<EOF
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_caps_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_caps_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- Define per-server settings (optional) and enable servers.
-- NOTE: This uses the Neovim 0.11+ LSP config API.
vim.lsp.config('*', { capabilities = capabilities })
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
    },
  },
})

vim.lsp.enable({ 'lua_ls', 'pyright', 'ts_ls', 'gopls' })

local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  cmp.setup {
    snippet = {
      expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
    }),
  }
end
EOF

" -----------------------------
" Keybindings
" -----------------------------
let mapleader=" "
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>
