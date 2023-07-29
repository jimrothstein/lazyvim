-- https://www.youtube.com/watch?v=n4Lp4cV8YR0&t=1951s
-- TJ Plugin example:   he calls  it `mapstack`
-- vim.api package/class
-- functions:
--    nvim_set_keymap()
--    nvim_get_keymap()
--
--
--
--    vim.api
local M = {}
-- USAGE:   require(`mapstack`).push()
M.push = function(name, mappings) end

M.pop = function(name) end

--  :x,y source
--
-- usage:  :lua P({key = "value"}), will print key=value
P = function(v)
  print(vim.inspect(v))
  return v
end

return M
