return {
  'rcarriga/nvim-notify',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  ---@type notify.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    stages = 'static',
  },
  keys = {
    { '<leader>fm', '<cmd>Telescope notify<cr>', desc = '[M]essages' },
    {
      '<leader>qm',
      function()
        require('notify').dismiss { silent = true, pending = true }
      end,
      desc = '[M]essages',
    },
  },
}
