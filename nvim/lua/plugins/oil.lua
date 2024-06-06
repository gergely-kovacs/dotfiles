return {
  'stevearc/oil.nvim',
  opts = {},
  init = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
