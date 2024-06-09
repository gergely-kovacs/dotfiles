return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufReadPre',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('rainbow-delimiters.setup').setup {
      highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
        'RainbowDelimiterGreen',
        'RainbowDelimiterRed',
      },
    }
  end,
}
