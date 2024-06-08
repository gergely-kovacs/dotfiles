return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', { desc = 'Neo[G]it Tab' } },
    { '<leader>gu', '<cmd>Neogit kind=split_above<cr>', { desc = 'Neo[G]it Split Above' } },
    { '<leader>gd', '<cmd>Neogit kind=split<cr>', { desc = 'Neo[G]it Split Below' } },
    { '<leader>gl', '<cmd>Neogit kind=vsplit<cr>', { desc = 'Neo[G]it Split Right' } },
    { '<leader>gc', '<cmd>Neogit commit<cr>', { desc = 'Neogit [C]ommit' } },
  },
}
