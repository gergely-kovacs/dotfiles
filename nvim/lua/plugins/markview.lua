return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  -- ft = "markdown" -- If you decide to lazy-load anyway
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    modes = { 'n', 'no', 'c' },
    hybrid_modes = { 'n' },
  },
}
