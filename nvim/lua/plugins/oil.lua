return {
  'stevearc/oil.nvim',
  opts = {
    git = true,
    view_options = {
      show_hidden = true,
    },
    win_options = {
      signcolumn = 'yes:2',
    },
  },
  init = function()
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
  end,
}
