return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  opts = {},
  config = function()
    vim.keymap.set('i', '<m-y>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<m-n>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<m-p>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<m-e>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<m-i>', function()
      return vim.fn['codeium#Complete']()
    end, { expr = true, silent = true })
  end,
}
