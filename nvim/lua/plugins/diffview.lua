return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    default_args = {
      DiffviewOpen = { '--imply-local' },
    },
  },
  keys = {
    {
      '<leader>gt',
      function()
        if next(require('diffview.lib').views) == nil then
          vim.cmd 'DiffviewOpen'
        else
          vim.cmd 'DiffviewClose'
        end
      end,
      desc = '[T]oggle Diffview',
    },
    { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = '[F]ile History' },
  },
}
