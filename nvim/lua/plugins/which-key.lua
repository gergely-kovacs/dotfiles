return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  ---@class wk.Opts
  opts = {
    preset = 'helix',
    icons = {
      rules = false,
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
  init = function()
    require('which-key').add {
      { '<leader>g', group = '[G]it' },
      { '<leader>g_', hidden = true },
      { '<leader>l', group = '[L]SP' },
      { '<leader>l_', hidden = true },
      { '<leader>q', group = '[Q]uit' },
      { '<leader>q_', hidden = true },
      { '<leader>w', group = '[W]rite' },
      { '<leader>w_', hidden = true },
    }
  end,
}
