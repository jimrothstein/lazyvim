-- TJ Plugin example:   he calls  it `mapstack`
-- REF:   https://www.youtube.com/watch?v=n4Lp4cV8YR0&t=1951s
--
-- vim.api package/class
-- functions:
--    nvim_set_keymap()
--    nvim_get_keymap()
--
--
-- usage:  :lua P({key = "value"}), will print key=value
P = function(v)
  print(vim.inspect(v))
  return v
end

--
--    vim.api
local M = {}
-- USAGE:   require(`mapstack`).push()
M.push = function(name, mode, mappings)
  local maps = vim.api.nvim_get_keymap(mode)
  -- P(maps)
end

M.pop = function(name) end

M.push("debug_mode", "n", {
  ["<leader>st"] = "echo 'hi'",
  ["<leader>sz"] = "echo 'cye'",
})
--  :x,y source
--
return M
