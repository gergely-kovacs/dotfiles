return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  ---@type notify.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    stages = 'static',
    timeout = 3000,
  },
  keys = {
    {
      '<leader>fm',
      function()
        require('notify.integrations.fzf').open()
      end,
      desc = '[M]essages',
    },
    {
      '<leader>qm',
      function()
        require('notify').dismiss { silent = true, pending = true }
      end,
      desc = '[M]essages',
    },
  },
}
