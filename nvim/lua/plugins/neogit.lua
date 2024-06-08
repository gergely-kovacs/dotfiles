return {
  'NeogitOrg/neogit',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Neo[G]it Tab' } },
    { '<leader>gk', '<cmd>Neogit kind=split_above<cr>', { desc = 'Neogit Split Above' } },
    { '<leader>gj', '<cmd>Neogit kind=split<cr>', { desc = 'Neogit Split Below' } },
    { '<leader>gl', '<cmd>Neogit kind=vsplit<cr>', { desc = 'Neogit Split Right' } },
    { '<leader>gc', '<cmd>Neogit commit<cr>', { desc = 'Neogit [C]ommit' } },
  },
}
