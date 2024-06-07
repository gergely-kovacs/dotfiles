return {
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'rmagatti/auto-session',
  },
  'rmagatti/session-lens',
  opts = {},
  init = function()
    require('telescope').load_extension 'session-lens'
  end,
  keys = {
    { '<leader>fs', '<cmd>SearchSession<cr>', desc = '[S]essions' },
  },
}
