local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('cpp', {
  s('sout', {
    t 'std::cout << ',
    i(1, 'msg'),
    t ';',
  }),
})
