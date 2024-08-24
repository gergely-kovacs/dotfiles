return {
  'stevearc/conform.nvim',
  event = 'BufReadPost',
  keys = {
    {
      '<leader>i',
      function()
        require('conform').format {
          async = true,
          lsp_fallback = true,
          timeout_ms = 2500,
        }
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    notify_on_error = false,
    -- format_on_save = function(bufnr)
    --   -- Disable "format_on_save lsp_fallback" for languages that don't
    --   -- have a well standardized coding style. You can add additional
    --   -- languages here or re-enable it for the disabled ones.
    --   local disable_filetypes = {
    --     c = true,
    --     cpp = true,
    --   }
    --   return {
    --     timeout_ms = 500,
    --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --   }
    -- end,
    format_on_save = false,
    formatters_by_ft = {
      -- Conform can also run multiple formatters sequentially
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      python = {
        'ruff_fix',
        'ruff_format',
      },
      lua = { 'stylua' },
      javascript = { 'prettierd' },
      typescript = { 'prettierd' },
      typescriptreact = { 'prettierd' },
      json = { 'prettierd' },
      yaml = { 'prettierd' },
      html = { 'prettierd' },
      css = { 'prettierd' },
      markdown = { 'prettierd' },
    },
  },
}
