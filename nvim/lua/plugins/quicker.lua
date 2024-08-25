return {
  'stevearc/quicker.nvim',
  event = 'FileType qf',
  init = function()
    ---@module "quicker"
    ---@type quicker.SetupOptions
    require('quicker').setup {
      keys = {
        {
          '>',
          function()
            require('quicker').expand { before = 2, after = 2, add_to_existing = true }
          end,
          desc = 'Expand quickfix context',
        },
        {
          '<',
          function()
            require('quicker').collapse()
          end,
          desc = 'Collapse quickfix context',
        },
      },
    }
    vim.keymap.set('n', '<leader>lq', function()
      require('quicker').toggle()
    end, {
      desc = '[Q]uickfix toggle',
    })
    vim.keymap.set('n', '<leader>ll', function()
      require('quicker').toggle { loclist = true }
    end, {
      desc = '[L]oclist toggle',
    })
  end,
}
