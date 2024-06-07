return {
  'gbprod/yanky.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  init = function()
    require('telescope').load_extension 'yank_history'

    vim.keymap.set({ 'n', 'x' }, '<leader>fy', '<cmd>Telescope yank_history<cr>', { desc = '[Y]ank history' })

    vim.keymap.set({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = 'Yanky Put After' })
    vim.keymap.set({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = 'Yanky Put Before' })
    vim.keymap.set({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { desc = 'Yanky Put in Next Line' })
    vim.keymap.set({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { desc = 'Yanky Put in Previous Line' })

    vim.keymap.set('n', ']y', '<Plug>(YankyNextEntry)', { desc = 'Next Yank Entry' })
    vim.keymap.set('n', '[y', '<Plug>(YankyPreviousEntry)', { desc = 'Previous Yank Entry' })
  end,
}
