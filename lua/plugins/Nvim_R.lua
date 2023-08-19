-- Nvim_R.lua  , plugin configure
-- 2023-08-14:  sort of working, but simple Nvim_R commands screwed up
--
return {

  -- Nvim-R  (2023-06-15:   try NOT to use lsp r server, till know what I am doing)
  --[[
  {
    require("cmp_nvim_r").setup({
      filetypes = { "r", "rmd", "quarto" },
      doc_width = 58,
    }),
  },
  { "jalvesaq/Nvim-R" },

  ------------------------------
  --    HOLD till R is working
  ------------------------------
  -- [[
  -- override nvim-cmp and add cmp-emoji
  -- nvim-cmp is plugin, provides autocompletion to neovim.  Sources (buffer, LSP, ...) must be configured.
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-emoji" },
      { "jalvesaq/cmp-nvim-r" },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "emoji" },
        { name = "cmp_nvim_r" },
        { name = "luasnip" }, -- jr added
      }))
    end,
  },
  --
  --]]
}
