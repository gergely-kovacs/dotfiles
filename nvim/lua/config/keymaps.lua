-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next [D]iagnostic message' })
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { desc = '[E]rror messages' })
-- vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = '[Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigate buffers
vim.keymap.set('n', '<s-h>', ':bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<s-l>', ':bnext<CR>', { desc = 'Next buffer' })

-- Write buffers
vim.keymap.set('n', '<leader>ww', ':w<cr>', { desc = 'Write current buffer' })
vim.keymap.set('n', '<leader>wa', ':wa<cr>', { desc = 'Write all buffers' })

-- Quit buffers and windows
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>qq', ':q<cr>', { desc = 'Quit current buffer' })
vim.keymap.set('n', '<leader>qa', ':qa<cr>', { desc = 'Quit all buffers' })
