return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  -- ft = "markdown" -- If you decide to lazy-load anyway
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    preview = {
      icon_provider = 'devicons',
      hybrid_modes = { 'n' },
      modes = { 'n', 'no', 'c' },
    },
  },
}
