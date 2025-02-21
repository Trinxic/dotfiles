local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('python', {
  s('main', {
    t {
      'def main():',
      '    pass',
      '',
      'if __name__ == "__main__":',
      '    main()',
    },
  }),
})
