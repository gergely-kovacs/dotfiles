return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  config = function()
    local neocodeium = require 'neocodeium'

    neocodeium.setup { debounce = true }

    vim.keymap.set('i', '<m-e>', neocodeium.clear)
    vim.keymap.set('i', '<m-y>', neocodeium.accept)
    vim.keymap.set('i', '<m-w>', neocodeium.accept_word)
    vim.keymap.set('i', '<m-a>', neocodeium.accept_line)
    vim.keymap.set('i', '<m-n>', neocodeium.cycle_or_complete)
    vim.keymap.set('i', '<m-p>', function()
      neocodeium.cycle_or_complete(-1)
    end)
  end,
}
