return {
  'stevearc/oil.nvim',
  opts = {
    win_options = {
      signcolumn = 'yes:1',
    },
  },
  init = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
