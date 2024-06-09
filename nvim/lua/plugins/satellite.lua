return {
  'lewis6991/satellite.nvim',
  event = 'BufReadPre',
  opts = {
    handlers = {
      gitsigns = {
        enable = true,
        signs = {
          add = '▎',
          change = '▎',
          delete = '',
        },
      },
    },
  },
}
