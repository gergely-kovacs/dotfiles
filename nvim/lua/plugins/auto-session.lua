return {
  'rmagatti/auto-session',
  lazy = false,
  priority = 100,
  config = function()
    require('auto-session').setup {
      auto_session_suppress_dirs = {
        '/',
        '~/',
        '~/Downloads',
      },
    }
  end,
}
