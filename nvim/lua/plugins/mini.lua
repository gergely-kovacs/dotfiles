return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.bufremove').setup()

    require('mini.ai').setup {
      n_lines = 500,
    }

    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode.
        left = '<M-h>',
        right = '<M-l>',
        down = '<M-j>',
        up = '<M-k>',

        -- FIXME: does not always move in normal mode
        -- Move current line in Normal mode
        line_left = '',
        line_right = '',
        line_down = '<M-j>',
        line_up = '<M-k>',
      },
    }

    require('mini.surround').setup {
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding
        update_n_lines = 'gsn', -- Update `n_lines`

        suffix_last = 'p', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }
  end,
}
