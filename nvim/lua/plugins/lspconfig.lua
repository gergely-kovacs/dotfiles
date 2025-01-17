return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'williamboman/mason.nvim',
      dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
      },
    },
    {
      'folke/neodev.nvim',
      opts = {},
    },
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    inlay_hints = {
      enabled = true,
    },
    codelens = {
      enabled = true,
    },
    document_highlight = {
      enabled = true,
    },
    ui = {
      border = 'rounded',
    },
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, {
            buffer = event.buf,
            desc = '[LSP] ' .. desc,
          })
        end

        map('gy', require('telescope.builtin').lsp_type_definitions, 'T[y]pe Definition')
        map('gd', require('telescope.builtin').lsp_definitions, '[D]efinition')
        map('gD', vim.lsp.buf.declaration, 'Declaration')
        map('gr', require('telescope.builtin').lsp_references, '[R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, 'Implementation')
        map('<leader>ld', require('telescope.builtin').lsp_document_symbols, '[D]ocument Symbols')
        map('<leader>lw', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace Symbols')
        -- map('<leader>lr', vim.lsp.buf.rename, '[R]ename')
        map('<leader>la', vim.lsp.buf.code_action, '[A]ctions')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', {
            clear = false,
          })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', {
              clear = true,
            }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds {
                group = 'kickstart-lsp-highlight',
                buffer = event2.buf,
              }
            end,
          })
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    local servers = {
      gopls = {},
      rust_analyzer = {
        settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
              extraArgs = {
                '--',
                '--no-deps',
                '-Dclippy::correctness',
                '-Dclippy::complexity',
                '-Wclippy::perf',
              },
            },
          },
        },
      },
      tailwindcss = {},
      ruff = {},
      mypy = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'off',
            },
          },
        },
      },
      stylua = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      },
    }

    require('mason').setup()

    vim.keymap.set('n', '<leader>M', '<cmd>Mason<cr>', { desc = '[M]ason' })

    local ensure_installed = vim.tbl_keys(servers or {})

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    local lspconfig = require 'lspconfig'
    lspconfig.gleam.setup {}
    lspconfig.gdscript.setup {
      name = 'godot',
      cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
    }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          lspconfig[server_name].setup(server)
        end,
      },
    }
  end,
}
