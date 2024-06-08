return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    sections = {
      lualine_a = {
        'mode',
      },
      lualine_b = {
        { 'filename', path = 1 },
      },
      lualine_c = {
        'branch',
        'diff',
      },
      lualine_x = {
        'diagnostics',
      },
      lualine_y = {
        'fileformat',
        'encoding',
        'filetype',
      },
      lualine_z = {
        'location',
        'progress',
      },
    },
    extensions = {
      'oil',
      'lazy',
      'mason',
      'trouble',
    },
  },
}
