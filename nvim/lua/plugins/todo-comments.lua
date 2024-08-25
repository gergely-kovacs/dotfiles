return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  cmd = { 'TodoTelescope' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    signs = false,
    highlight = {
      multiline = false,
      keyword = 'bg',
      after = '',
    },
  },
  keys = {
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next Todo Comment',
    },
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous Todo Comment',
    },
    { '<leader>fn', '<cmd>TodoTelescope<cr>', desc = '[N]otes' },
    { '<leader>fN', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo / Fix / Fixme' },
  },
}
