return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
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

    -- https://github.com/scottmckendry/cyberdream.nvim/blob/main/lua/cyberdream/colors.lua
    local colors = {
      bg = '#16181a',
      bg_alt = '#1e2124',
      bg_highlight = '#3c4048',
      fg = '#ffffff',
      grey = '#7b8496',
      blue = '#5ea1ff',
      green = '#5eff6c',
      cyan = '#5ef1ff',
      red = '#ff6e5e',
      yellow = '#f1ff5e',
      magenta = '#ff5ef1',
      pink = '#ff5ea0',
      orange = '#ffbd5e',
      purple = '#bd5eff',
    }

    -- https://github.com/scottmckendry/cyberdream.nvim/blob/main/lua/cyberdream/extensions/heirline.lua
    local lualine_theme = {
      inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
      normal = {
        a = { fg = colors.bg, bg = colors.blue },
        b = { fg = colors.bg, bg = colors.grey },
        c = { fg = colors.fg, bg = colors.bg },
      },
      visual = { a = { fg = colors.bg, bg = colors.magenta } },
      replace = { a = { fg = colors.bg, bg = colors.red } },
      command = { a = { fg = colors.bg, bg = colors.yellow } },
      insert = { a = { fg = colors.bg, bg = colors.green } },
      terminal = { a = { fg = colors.bg, bg = colors.cyan } },
    }

    -- https://github.com/ryanoasis/powerline-extra-symbols
    -- https://www.nerdfonts.com/cheat-sheet
    require('lualine').setup {
      options = {
        theme = lualine_theme,
        component_separators = '',
        section_separators = { left = ' ', right = ' ' },
      },
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
