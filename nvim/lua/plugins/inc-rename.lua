return {
  'smjonas/inc-rename.nvim',
  event = 'BufReadPost',
  opts = {},
  keys = {
    {
      '<leader>lr',
      function()
        return ':IncRename ' -- .. vim.fn.expand '<cword>'
      end,
      desc = 'Incremental [R]ename',
      expr = true,
    },
  },
}
