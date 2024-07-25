return {
  'pmizio/typescript-tools.nvim',
  event = 'BufReadPost',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
  },
  config = function()
    require('typescript-tools').setup {
      on_attach = function(_, bufnr)
        vim.keymap.set(
          'n',
          '<leader>o',
          '<cmd>TSToolsOrganizeImports<cr>',
          { buffer = bufnr, desc = '[O]rganize Imports' }
        )
        vim.keymap.set('n', '<leader>lR', '<cmd>TSToolsRenameFile<cr>', { buffer = bufnr, desc = 'Rename file' })
      end,
    }
  end,
}
