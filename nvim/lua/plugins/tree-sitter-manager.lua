return {
  'romus204/tree-sitter-manager.nvim',
  -- tree-sitter CLI must be installed system-wide
  keys = {
    { '<leader>T', '<cmd>TSManager<cr>', desc = '[T]ree-sitter' },
  },
  opts = {},
  -- config = function()
  --   require('tree-sitter-manager').setup {
  --     -- ensure_installed = { "bash", "lua", "python" }, -- list of parsers to install automatically
  --     -- Optional: custom paths
  --     -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
  --     -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
  --   }
  -- end,
}
