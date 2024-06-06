return {
  'HiPhish/rainbow-delimiters.nvim',
  lazy = true,
  event = 'VeryLazy',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('rainbow-delimiters.setup').setup {
      -- TODO: configure colours
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end,
}
