return {
  'rachartier/tiny-code-action.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    { '<leader>la', '<cmd>lua require("tiny-code-action").code_action()<cr>', { desc = 'Code [A]ctions (Tiny)' } },
  },
}
