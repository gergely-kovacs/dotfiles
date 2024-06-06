return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_a = {
        'mode',
        'searchcount',
      },
      lualine_b = {
        'branch',
        'diff',
      },
      lualine_c = {
        'diagnostics',
      },
      lualine_x = {
        'fileformat',
        'encoding',
      },
      lualine_y = {
        'filetype',
      },
      lualine_z = {
        'filename',
        'location',
      },
    },
    extensions = {
      'oil',
    },
  },
}
