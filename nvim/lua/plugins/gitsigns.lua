return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  keys = {
    {
      ']h',
      function()
        require('gitsigns').nav_hunk 'next'
      end,
      desc = 'Next Hunk',
    },
    {
      '[h',
      function()
        require('gitsigns').nav_hunk 'prev'
      end,
      desc = 'Prev Hunk',
    },
    {
      ']H',
      function()
        require('gitsigns').nav_hunk 'last'
      end,
      desc = 'Last Hunk',
    },
    {
      '[H',
      function()
        require('gitsigns').nav_hunk 'first'
      end,
      desc = 'First Hunk',
    },
    {
      '<leader>gs',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').stage_hunk()
      end,
      desc = '[S]tage Hunk',
    },
    {
      '<leader>gr',
      mode = { 'n', 'v' },
      function()
        require('gitsigns').reset_hunk()
      end,
      desc = '[R]eset Hunk',
    },
    {
      '<leader>gS',
      function()
        require('gitsigns').stage_buffer()
      end,
      desc = 'Stage buffer',
    },
    {
      '<leader>gR',
      function()
        require('gitsigns').reset_buffer()
      end,
      desc = 'Reset buffer',
    },
    {
      '<leader>gp',
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = '[P]review Hunk Inline',
    },
    {
      '<leader>gb',
      function()
        require('gitsigns').blame_line { full = true }
      end,
      desc = '[B]lame Line',
    },
    {
      '<leader>gB',
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      desc = 'Toggle Current Line Blame',
    },
    {
      '<leader>gd',
      function()
        require('gitsigns').diffthis()
      end,
      desc = '[D]iff This',
    },
    {
      '<leader>gD',
      function()
        require('gitsigns').diffthis '~'
      end,
      desc = 'Diff This ~',
    },
    {
      'ih',
      mode = { 'o', 'x' },
      ':<C-U>Gitsigns select_hunk<CR>',
      desc = 'Inside hunk',
    },
  },
  opts = {
    attach_to_untracked = true,
    preview_config = {
      border = 'rounded',
      row = 1,
    },
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
  },
}
