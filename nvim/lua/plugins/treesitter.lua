return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    local available = {}
    for _, lang in ipairs(ts.get_available()) do
      available[lang] = true
    end

    local installed = {}
    for _, lang in ipairs(ts.get_installed()) do
      installed[lang] = true
    end

    local installing = {}

    local function enable_treesitter(bufnr, lang)
      vim.treesitter.start(bufnr, lang)
      vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('dotfiles_treesitter_auto_install', { clear = true }),
      callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang or not available[lang] then
          return
        end

        if installed[lang] then
          pcall(enable_treesitter, ev.buf, lang)
          return
        end

        if installing[lang] then
          return
        end

        installing[lang] = true

        ts.install(lang):await(function(err, ok)
          installing[lang] = nil

          if err or not ok then
            vim.schedule(function()
              vim.notify(
                string.format('Failed to install treesitter parser for %s', lang),
                vim.log.levels.WARN
              )
            end)
            return
          end

          installed[lang] = true

          vim.schedule(function()
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].filetype == ft then
                pcall(enable_treesitter, bufnr, lang)
              end
            end
          end)
        end)
      end,
    })

    vim.treesitter.language.register('html', 'mjml')

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  end,
}
