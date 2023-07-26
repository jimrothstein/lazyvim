--
-- 21-July-2023

--          To load:  nvim/init.lua MUST require('config.luasnip')
--          WHY? lazyvim auto loads only the 4 files in config (?)
--          TODO:
--              *   DO NOT BREAK !!
--              *   Find correct place/config for luasnip receipes
--              *   Config nvim-cmp, or options.lua (?) so MENU appears
--              *   DUP shortcuts, FIX
--
--  REF:   https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
--  REF (video:)  ziontee113 <https://www.youtube.com/watch?v=ub0REXjhpmk&t=175s>
--    -   he adds snippets to table, and returns table.
--
-- required shortcuts
--

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- HELPER
local test1 = function()
  return { os.date("%d-%B-%Y") }
end

local filename = function()
  return { vim.fn.expand("%:p") }
end

ls.add_snippets("all", { -- 'all' = global
  s("snip1", { t("first") }), -- s takes 2 args, <name> and table
  --
  s("snip2", {
    t("second"),
    i(1, " placeholder"), -- position 1,
    t({ "", "new line" }), -- t takes a table, for new line
  }), -- s takes 2 args, <name> and table
  --
  s("ternary", {
    -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
    i(1, "cond"),
    t(" ? "),
    i(2, "then"),
    t(" : "),
    i(3, "else"),
  }),
  -- using non-abbrex
  -- snip:  test1 (date)
  snip({
    trig = "test1",
    namr = "Date",
    dscr = "Test1:: Date in the form of YYYY-MM-DD",
  }, {
    func(test1, {}),
  }),
  s({
    trig = "triggerA",
    dscr = "triggerA",
  }, {
    t("Wow"),
  }),
  --- snip: squote
  s({ trig = "squote", dscr = "Single quotes" }, {
    t("'"),
    i(1),
    t("'"),
    i(0),
  }),
  --- snip: backtick
  s({ trig = "backtick", dscr = "Single quotes" }, {
    t("`"),
    i(1),
    t("`"),
    i(0),
  }),
  s({ trig = "file", dscr = "insert filename" }, {
    func(filename, {}),
  }),

  --  s({ trig = "filei", dscr = "insert filename" }, {
  --   "file =" .. func(filename, {}),
  -- }),
  --
  s("trigger4", {
    t({ "After expanding, the cursor is here, then <TAB> ->" }),
    i(1),
    t({ "", "After jumping forward once, cursor is here ->" }),
    i(2),
    t({ "", "After jumping once more, the snippet is exited there ->" }),
    i(0),
  }),
  --
  s("snip6", {}),
}) -- end all snippets
