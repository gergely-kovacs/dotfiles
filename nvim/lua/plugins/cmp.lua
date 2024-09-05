return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
  },
  config = function()
    local cmp = require 'cmp'

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm(),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
      }, {
        { name = 'buffer' },
      }),
    }

    local cmdline_mapping = {
      ['<C-n>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
      },
      ['<C-p>'] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },
      ['<C-Space>'] = {
        c = cmp.mapping.complete(),
      },
      ['<C-e>'] = {
        c = cmp.mapping.abort(),
      },
      ['<C-y>'] = {
        c = cmp.mapping.confirm { select = false },
      },
    }

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmdline_mapping,
      sources = {
        { name = 'buffer' },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmdline_mapping,
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}
