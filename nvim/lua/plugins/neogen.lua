return {
  'danymat/neogen',
  event = 'BufRead',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>lc', '<cmd>lua require("neogen").generate()<cr>', desc = 'Generate [C]omment string' },
  },
  opts = {
    enabled = true,
  },
}
