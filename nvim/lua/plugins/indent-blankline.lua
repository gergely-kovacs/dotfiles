return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'BufReadPre',
  dependencies = {
    'TheGLander/indent-rainbowline.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = function(_, opts)
    ---@type ibl.config
    local custom_opts = {
      -- FIXME: remove the indentation on blank lines
      indent = {
        char = '',
      },
      scope = {
        enabled = false,
      },
      whitespace = {
        remove_blankline_trail = false,
      },
    }

    opts = vim.tbl_deep_extend('force', opts, custom_opts)

    return require('indent-rainbowline').make_opts(opts, {
      -- How transparent should the rainbow colors be. 1 is completely opaque, 0 is invisible. 0.07 by default
      -- color_transparency = 0.09,
      -- The 24-bit colors to mix with the background. Specified in hex.
      -- { 0xffff40, 0x79ff79, 0xff79ff, 0x4fecec, } by default
      colors = {
        -- 0xe81416,
        0xffa500,
        0xfaeb36,
        -- 0x79c314,
        0x487de7,
        0x4b369d,
        0x70369d,
      },
    })
  end,
}
