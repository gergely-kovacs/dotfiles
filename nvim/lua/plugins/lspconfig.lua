return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'ibhagwan/fzf-lua',
    'saghen/blink.cmp',
    {
      'mason-org/mason-lspconfig.nvim',
      dependencies = {
        'mason-org/mason.nvim',
      },
    },
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
    servers = {
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
      tailwindcss = {
        root_dir = function(bufnr, on_dir)
          local result = vim.fn.systemlist "rg --fixed-strings 'tailwindcss'"

          if #result > 0 then
            on_dir(vim.fn.getcwd())
          else
            on_dir(nil)
          end
        end,
      },
      ruff = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = 'off',
            },
          },
        },
      },
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
    },
  },
  config = function(_, opts)
    require('mason-lspconfig').setup {
      automatic_enable = false,
      ensure_installed = vim.tbl_keys(opts.servers),
    }

    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end

    vim.lsp.config('gdscript', {
      name = 'godot',
      cmd = vim.lsp.rpc.connect('127.0.0.1', 6005),
    })
    vim.lsp.enable 'gdscript'

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, {
            buffer = event.buf,
            desc = '[LSP] ' .. desc,
          })
        end

        map('gy', require('fzf-lua').lsp_typedefs, 'T[y]pe Definition')
        map('gd', vim.lsp.buf.definition, '[D]efinition')
        map('gD', vim.lsp.buf.declaration, 'Declaration')

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
  end,
}
