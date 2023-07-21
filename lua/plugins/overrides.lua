-- stolen from < https://github.com/justinsgithub/dotfiles/tree/main/neovim/.config/nvim/lua/plugins>
-- 2023-07-20
-- Which-Key  - this adds features.  seems to work ok.
-- Anything does not work?    Just remoove this file.
--
local Util = require("lazyvim.util")

return {
  ----

  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>dX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>dL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>dQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>dt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>dT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
    },
    config = function(_, opts)
      local defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        -- ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<localleader>s"] = { name = "+Surround" },
        ["<leader>t"] = { name = "+Tabs" },
        ["<leader>b"] = { name = "+Buffer" },
        ["<leader>c"] = { name = "+Code" },
        ["<leader>d"] = { name = "+Diagnostics" },
        ["<leader>f"] = { name = "+Find" },
        ["<leader>g"] = { name = "+Git" },
        ["<leader>gh"] = { name = "+Hunks" },
        ["<leader>q"] = { name = "+Session" },
        ["<leader>s"] = { name = "+Search" },
        ["<leader>p"] = { name = "+Plugins" },
        ["<leader>u"] = { name = "+UI" },
        ["<leader>w"] = { name = "+Windows" },
      }
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(defaults)
    end,
  },
  -- fix notify background_colour
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
