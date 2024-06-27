return {
  'pmizio/typescript-tools.nvim',
  event = 'BufReadPost',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {},
  keys = {
    {
      '<leader>o',
      '<cmd>TSToolsOrganizeImports<cr>',
      desc = '[O]rganize Imports',
    },
    {
      '<leader>lR',
      '<cmd>TSToolsRenameFile<cr>',
      desc = 'Rename file',
    },
  },
}
