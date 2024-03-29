-- Options are automatically loaded before lazy.nvim startup
-- Add any additional options here
--

--  <mapleader>, <maplocalleader>   -- SEE keymaps.lua
-- vim.g.mapleader = " "
-- vim.g.localmapleader = " "
--
----------------
-- Experiemental
----------------
--
-- {{{  fold
vim.o.foldmethod = "marker" --
vim.o.foldlevel = 0 --
-- }}}

--
----------
--  Nvim-R
----------
vim.cmd([[ let R_assign=2 ]])
vim.cmd([[ let R_enable_comment = 1 ]]) -- toggle comments <leader>xx
vim.g.R_assign = 2 --  turn off netrw (`let g:loaded_netrw = 1`)
--
--  REF         ThePrimeagen
--
if false then
  print("hello: nvim/config/options.lua")
end

-- $HOST is shell environmental var, set by initialize.zsh
local HOST = os.getenv("HOST") --- which machine?
if true then
  print("LUA thinks I am using " .. vim.inspect(HOST))
end

vim.opt.numberwidth = 3

if HOST == "jim-ThinkPad-T480" then
  vim.cmd([[ set background=light]])
else
  vim.cmd([[ set background=dark]]) -- acer-desktop
end

-- leave default (set clipboard=unnamedplus)
-- vim.cmd([[ set clipboard+=unnamedplus]])

vim.cmd([[ syntax on]])
vim.g.listchars = "tab:>-,space:="

vim.opt.conceallevel = 0 -- show chunk markers
vim.opt.tabstop = 2
--
vim.opt.shiftwidth = 2

--

--  remove all that highlighting, except during search
--
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- keep 8
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

--  practice function
local function nohl_or_buffer_cycle()
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
  else
    vim.g.hlsearch = 1
    -- vim.cmd("BufferLineCycleNext")
  end
end

vim.keymap.set("n", "<C-l>", nohl_or_buffer_cycle)
