-- Habilitar a sintaxe Lua
vim.opt.syntax = 'enable'

-- Configurações básicas
vim.opt.guicursor = 'i:block'
vim.opt.autoindent = true
vim.opt.inccommand = 'split'
vim.opt.modifiable = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.relativenumber = true                                                                              init.lua                                                                                          
vim.opt.scrolloff = 8
vim.opt.backspace = 'indent,eol,start'
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.laststatus = 2
vim.opt.showmatch = true
vim.opt.errorbells = false
vim.opt.autowrite = true
vim.opt.wrap = false
vim.opt.backup = false
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.termguicolors = true

-- Mapeamentos usando Lua
vim.api.nvim_set_keymap('n', '<leader>;', 'A;<esc>', { noremap = true })

-- Funções para obter o nome do branch do Git e construir a linha de status
local function git_branch()
  return vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
end

local function statusline_git()
  local branchname = git_branch()
  return #branchname > 0 and '  ' .. branchname .. ' ' or ''
end

-- Configuração da linha de status
vim.opt.statusline = [[
  %=   " Adiciona um espaço antes do símbolo '=' para alinhar corretamente
  %F
  %m
  %=   " Adiciona um espaço depois de '%m' para alinhar corretamente
  %y
  %=   " Adiciona um espaço depois de '%y' para alinhar corretamente
  %{&fileencoding or &encoding}
  |%{&fileformat}
  %p%%
  %l:%c
]]

