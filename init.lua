-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- NOTES:
-- require("config")                  should run ~/.config/nvim/lua/config/init.lua
-- require("bees")                  -- will run ~/.config/nvim/lua/bees.lua -- :use messages to see
--
require("config.bees") -- runs ~/.config/nvim/lua/config/bees.lua
require("config.luasnip") -- runs ~/.config/nvim/lua/config/luasnip.lua (my snips)
