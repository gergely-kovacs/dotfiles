return {
  'danymat/neogen',
  event = 'BufRead',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    {
      '<leader>lc',
      function()
        require('neogen').generate()
      end,
      desc = 'Generate [C]omment string',
    },
  },
  opts = {
    enabled = true,
  },
}
