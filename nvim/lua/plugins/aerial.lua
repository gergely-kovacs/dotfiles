return {
  'stevearc/aerial.nvim',
  event = 'BufReadPre',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    on_attach = function(bufnr)
      vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
      vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
    end,
  },
  init = function()
    vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
  end,
}
