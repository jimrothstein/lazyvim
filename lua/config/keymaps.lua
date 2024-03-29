-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- TAGS:    which-key, telescope.builtin
--
--
-- TODO
--  Stole from https://github.com/sum-rock/just-sum-nix/blob/master/homes/modules/neovim/lua/navigation.lua
--  Telescope:  include hidden files
--  Telescope:  CLEAN UP
----------------------------------
--
------------------------------------
--      Command line (EX) navigation
------------------------------------
--
vim.keymap.set("c", "<C-A>", "<HOME>")
vim.keymap.set("c", "<C-F>", "<RIGHT>") -- one char
vim.keymap.set("c", "<C-B>", "<LEFT>") -- one char
vim.keymap.set("c", "<M-B>", "<S-LEFT>") -- one word
vim.keymap.set("c", "<M-F>", "<S-RIGHT>")

--[[  BUILTIN:
--  <C-W> delete word just before cursor
--  <C-U> delete from CURSOR left
--
--]]
---------------
--    R, Nvim-R
---------------
-- STUDY:  https://github.com/jalvesaq/Nvim-R/issues/711--
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set("", "<Space>", "<Nop>")

vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")
vim.keymap.set("n", "<silent>", "<C-H> <Cmd>noh<CR>")

vim.keymap.set("v", "<Enter>", "<Plug>RDSendSelection")
-- vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine")

-- rest is mine

vim.keymap.set("n", "<leader>:", ":RStop")
vim.keymap.set("n", "<leader>cg", "<C-Q>") -- close R graph

-- Experimental
vim.keymap.set("n", "<leader>:l", "<ALT-l>")
vim.keymap.set("n", "<leader>:h", "<ALT-h>")

--  easy ESC
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("i", "kk", "<ESC>")

--
--
----------------------------------------------------------
-- PUPORSE:   create user defined function
-- USAGE:    :Say Jim | :Say a b c
--           : Lost
--           : GoLC,  1st letter MUST be capitalized
-- NOTE:     command!  means overwrite with new version
-- TODO:      Put into lua
-- SEE /home/jim/code/lua_project/130_user_defined_command.lua
----------------------------------------------------------
--
vim.cmd([[
  :command! -nargs=+ Say :echo "<args>"
  :command! -nargs=0 Lost :pwd
  :command! -nargs=0 GoLC :cd ~/.config/nvim/lua/config/ 
  ]])
----------------------------------
--
-- PURPOSE:   Make it easy to jump back to very last file edited of each type.
-- USEAGE:    'C   to return to last CSS, SCSS file edited
-- REF:       https://gist.github.com/romainl/3e0cb99343c72d04e9bc10f6d76ebbef
vim.cmd([[
augroup AutomaticMarks
    autocmd!
    autocmd BufLeave *.css,*.scss normal! mC
    autocmd BufLeave *.lua        normal! mL
    autocmd BufLeave *.yml,*.yaml normal! mY
    autocmd BufLeave *.md         normal! mM
    autocmd BufLeave *.R *.Rmd    normal! mR
    autocmd BufLeave *.qmd        normal! mQ
    autocmd BufLeave *.zsh        normal! mZ
augroup END
]])

--  insert # --------...
vim.keymap.set("n", "<leader>ic", "yypVr-I# <ESC>")

----------------------------------
--TODO:  virtualedit mode
--vim.keymap.set("n", "<leader><Tab>", "12i<TAB>##")
--  move cursor 12 tabs, insert ##
--

--
--------------------------------------------

-- TEST:    :lua require("telescope.builtin").$NAME_OF_PICKEr
--[[
require("telescope.builtin").live_grep({
  prompt_title = "find string in open bufs",
  grep_open_files = true,
})
--]]
--
vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").find_files({ previewer = false, search_dirs = { "~/.dotfiles" } })
end)

-- works
vim.keymap.set("n", "<leader>fh", ":lua require('telescope.builtin').find_files( {search_dirs={'~/dotfiles'}})<cr>")
vim.keymap.set("n", "<leader>fz", ":lua require('telescope.builtin').find_files( {search_dirs={'~'}})<cr>")

--     keep cursor in center
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

---------------------- ALT-Terminal ----------------------
-- I stole
-- Split navigations.  TODO:  jumpto or from Terminal
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-h>", "<C-w>h")

-- Buffer resizing. TODO: conflic! Find another kemap to resize
-- vim.keymap.set("n", "<S-h>", ":call ResizeLeft(3)<CR><Esc>")
-- vim.keymap.set("n", "<S-l>", ":call ResizeRight(3)<CR><Esc>")
-- vim.keymap.set("n", "<S-k>", ":call ResizeUp(1)<CR><Esc>")
-- vim.keymap.set("n", "<S-j>", ":call ResizeDown(1)<CR><Esc>")   -- <S-j> concatinate 2 lines

-- ToggleTerm
local function set_terminal_keymaps()
  vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
  vim.keymap.set("t", "<A-h>", "<c-\\><c-n><c-w>h")
  vim.keymap.set("t", "<A-j>", "<c-\\><c-n><c-w>j")
  vim.keymap.set("t", "<A-k>", "<c-\\><c-n><c-w>k")
  vim.keymap.set("t", "<A-l>", "<c-\\><c-n><c-w>l")

  --   TODO:  interfering with navigation
  --  vim.keymap.set("t", "<S-h>", "<c-\\><C-n>:call ResizeLeft(3)<CR>")
  --  vim.keymap.set("t", "<S-j>", "<c-\\><C-n>:call ResizeDown(1)<CR>")
  --  vim.keymap.set("t", "<S-k>", "<c-\\><C-n>:call ResizeUp(1)<CR>")
  --  vim.keymap.set("t", "<S-l>", "<c-\\><C-n>:call ResizeRight(3)<CR>")
end

--  open terminal, in insert mode
vim.keymap.set("n", "<leader>tt", ":vsplit term://zsh<CR>a")

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function()
    set_terminal_keymaps()
  end,
})
-- ALT-Terminal  END
--
-- Don't copy the replaced text after pasting.
vim.keymap.set("v", "p", '"_dP')

-- With this you can use > < multiple time for changing indent when you visual selected text.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--
-- Experimental 2023-07-25
--  STOLE from :h which-key help (method 2)
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    Q = {
      name = "+file", -- optional group name
      -- vim.keymap.set("n", "<leader>fz", builtin.find_files({ cwd = "~" }))
      -- ho = { "<cmd>Telescope find_files({cwd = '~'})<cr>", "Find - from home" }, --
      -- ho = { "builtin.find_files({ cwd = " ~ "})" },
      -- f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
      -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
      n = { "FAKE !" }, -- just a label. don't create any mapping
      e = "FAKE !! ", -- same as above
    },
  },
})

--------------------------------------------------------------------------------------------
-- REF:    https://raw.githubusercontent.com/hackorum/nfs/master/lua/whichkey-config/init.lua
---------------------------------------------------------------------------------------------
--[[
local mappings = {
  E = { ":e ~/.config/nvim/init.lua<cr>", "Edit nvim config" },
  Q = { ":wqa<cr>", "Save & Quit ALL" },
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
]]
---------------------- END ----------------------
