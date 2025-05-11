return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      italic_comments = true,
      extensions = {
        gitsigns = false,
        indentblankline = false,
      },
    }
    vim.cmd 'colorscheme cyberdream'
  end,
}
