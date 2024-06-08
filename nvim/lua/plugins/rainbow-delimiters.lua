return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufReadPre',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  config = function()
    require('rainbow-delimiters.setup').setup {
      -- TODO: configure colours
      -- TODO: comments ruin the bracket matching, look into it
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
