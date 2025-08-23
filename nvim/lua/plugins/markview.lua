return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  ---@class mkv.config
  opts = {
    preview = {
      hybrid_modes = { 'n' },
    },
  },
}
