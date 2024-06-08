return {
  'gbprod/yanky.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    -- stylua: ignore
    { "<leader>fy", function() require("telescope").extensions.yank_history.yank_history({ }) end, desc = "[Y]ank History" },
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank Text' },
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put Yanked Text After Cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put Yanked Text Before Cursor' },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put Yanked Text After Selection' },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put Yanked Text Before Selection' },
    { '[y', '<Plug>(YankyCycleForward)', desc = 'Cycle Forward Through Yank History' },
    { ']y', '<Plug>(YankyCycleBackward)', desc = 'Cycle Backward Through Yank History' },
  },
}
