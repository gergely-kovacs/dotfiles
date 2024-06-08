return {
  'nvim-pack/nvim-spectre',
  event = 'BufReadPre',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/which-key.nvim',
  },
  init = function()
    require('which-key').register {
      ['<leader>s'] = {
        name = '[S]pectre',
        _ = 'which_key_ignore',
      },
    }

    vim.keymap.set('n', '<leader>ss', '<cmd>lua require("spectre").toggle()<CR>', {
      desc = '[S]pectre Toggle',
    })
    vim.keymap.set('n', '<leader>sS', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
      desc = 'Spectre in current file',
    })
    vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
      desc = '[W]ord (current)',
    })
    vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = '[W]ord (current)',
    })
  end,
}
