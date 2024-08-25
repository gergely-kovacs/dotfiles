return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local line_count = function()
      local total_lines = vim.fn.line '$'
      return total_lines .. '≣'
    end

    local show_macro_recording = function()
      local recording_register = vim.fn.reg_recording()
      if recording_register == '' then
        return ''
      else
        return 'Rec @' .. recording_register
      end
    end

    require('lualine').setup {
      sections = {
        lualine_a = {
          'mode',
          show_macro_recording,
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
          'filetype',
        },
        lualine_y = {
          'encoding',
          'fileformat',
        },
        lualine_z = {
          'location',
          'progress',
          line_count,
        },
      },
      extensions = {
        'oil',
        'lazy',
        'mason',
      },
    }
  end,
}
