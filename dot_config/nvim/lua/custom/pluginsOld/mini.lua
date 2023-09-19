-- gloabally ENABLE mini.starter plugin
vim.g.ministarter_disable = false
-- autocmd TabNewEntered * ++nested lua MiniStarter.open()

local keybindings = require('custom.user.keybindings')



return {
  -- integration for mini.nvim (https://github.com/echasnovski/mini.nvim/tree/main)
  {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
      -- mini.comment setup
      local comment = require("mini.comment")
      comment.setup(
        {
          -- Options which control module behavior
          options = {
            start_of_line = true,
          },
          -- Module mappings. Use `''` (empty string) to disable one.
          mappings = {
            -- Toggle comment (like `gcip` - comment inner paragraph) for both
            -- Normal and Visual modes
            comment = keybindings.comments.normal,
            -- Toggle comment on current line
            comment_line = keybindings.comments.current_line,
            -- Define 'comment' textobject (like `dgc` - delete whole comment block)
            textobject = keybindings.comments.block,
          },
        }
      )

      -- mini.indentscope setup
      local indentscope = require("mini.indentscope")
      indentscope.setup()
    end
  }
}
