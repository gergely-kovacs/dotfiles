return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  cmd = { 'TodoFzfLua' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
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
    { '<leader>fn', '<cmd>TodoFzfLua<cr>', desc = '[N]otes' },
    {
      '<leader>fN',
      function()
        require('todo-comments.fzf').todo { keywords = { 'TODO', 'FIX', 'FIXME' } }
      end,
      desc = 'Todo / Fix / Fixme',
    },
  },
}
