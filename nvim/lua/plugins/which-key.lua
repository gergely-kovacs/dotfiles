return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>w'] = {
        name = '[W]rite',
        _ = 'which_key_ignore',
      },
      ['<leader>q'] = {
        name = '[Q]uit',
        _ = 'which_key_ignore',
      },
      ['<leader>l'] = {
        name = '[L]SP',
        _ = 'which_key_ignore',
      },
      ['<leader>g'] = {
        name = '[G]it',
        _ = 'which_key_ignore',
      },
    }
  end,
}
