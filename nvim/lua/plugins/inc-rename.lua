return {
  'smjonas/inc-rename.nvim',
  event = 'BufReadPost',
  opts = {},
  keys = {
    { '<leader>lr', '<cmd>IncRename<cr>', desc = 'Incremental [R]ename' },
  },
}
