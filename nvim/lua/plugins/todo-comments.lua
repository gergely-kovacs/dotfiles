return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  cmd = { 'TodoTrouble', 'TodoTelescope' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
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
    { '<leader>tn', '<cmd>Trouble todo toggle<cr>', desc = '[N]otes' },
    {
      '<leader>tN',
      '<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>',
      desc = 'Todo / Fix / Fixme',
    },
    { '<leader>fn', '<cmd>TodoTelescope<cr>', desc = '[N]otes' },
    { '<leader>fN', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>', desc = 'Todo / Fix / Fixme' },
  },
}
