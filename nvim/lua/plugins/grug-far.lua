return {
  'MagicDuck/grug-far.nvim',
  event = 'VeryLazy',
  config = function()
    require('grug-far').setup()
    require('which-key').add {
      { '<leader>s', group = '[S]earch and Replace' },
      { '<leader>s_', hidden = true },
    }
  end,
  keys = {
    { '<leader>ss', '<cmd>GrugFar<cr>', desc = '[S]earch and Replace' },
    {
      '<leader>sS',
      function()
        require('grug-far').open { prefills = { paths = vim.fn.expand '%' } }
      end,
      desc = 'Search and Replace (current file)',
    },
    {
      '<leader>sw',
      function()
        require('grug-far').open { prefills = { search = vim.fn.expand '<cword>' } }
      end,
      desc = '[W]ord (current)',
    },
    {
      '<leader>sv',
      function()
        require('grug-far').with_visual_selection { prefills = { paths = vim.fn.expand '%' } }
      end,
      desc = '[V]isual (current file)',
    },
  },
}
