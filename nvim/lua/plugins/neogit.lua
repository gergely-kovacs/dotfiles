return {
  'NeogitOrg/neogit',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'ibhagwan/fzf-lua',
  },
  opts = {},
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neo[G]it' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = '[C]ommit' },
  },
}
