-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- NOTES:
-- require("config")                  should run ~/.config/nvim/lua/config/init.lua
-- require("bees")                  -- will run ~/.config/nvim/lua/bees.lua -- :use messages to see
require("config.bees") -- should run ~/.config/nvim/lua/config/bees.lua
require("config.luasnip")
