return {
  'rmagatti/auto-session',
  lazy = false,
  priority = 100,
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  config = function()
    require('auto-session').setup {
      suppressed_dirs = {
        '/',
        '~/',
        '~/Downloads',
      },
      session_lens = {
        picker = 'fzf',
      },
    }
  end,
  keys = {
    { '<leader>fs', '<cmd>AutoSession search<cr>', desc = '[S]essions' },
  },
}
