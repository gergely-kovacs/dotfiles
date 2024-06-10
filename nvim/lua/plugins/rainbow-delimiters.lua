return {
  'HiPhish/rainbow-delimiters.nvim',
  event = 'BufReadPre',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local highlights = {
      -- { name = 'RainbowRed', color = '#e81416' },
      { name = 'RainbowOrange', color = '#ffa500' },
      { name = 'RainbowBlue', color = '#487de7' },
      { name = 'RainbowYellow', color = '#faeb36' },
      { name = 'RainbowViolet', color = '#70369d' },
      { name = 'RainbowGreen', color = '#79c314' },
      { name = 'RainbowIndigo', color = '#4b369d' },
    }
    local color_names = {}

    for index, item in ipairs(highlights) do
      table.insert(color_names, item.name)
      vim.api.nvim_set_hl(0, item.name, { fg = item.color })
    end

    require('rainbow-delimiters.setup').setup {
      highlight = color_names,
    }
  end,
}
