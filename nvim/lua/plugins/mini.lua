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

        -- Move current line in Normal mode
        line_left = '<M-h>',
        line_right = '<M-l>',
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

    require('mini.indentscope').setup {
      draw = {
        delay = 0,
        animation = require('mini.indentscope').gen_animation.none(),
        priority = 2,
      },
      mappings = {
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        goto_top = '[i',
        goto_bottom = ']i',
      },
      options = {
        border = 'both',
        indent_at_cursor = false,
        try_as_border = true,
      },
      symbol = '▏',
    }
  end,
}
