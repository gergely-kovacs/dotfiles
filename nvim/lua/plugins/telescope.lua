return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',
      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  keys = {
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = '[B]uffers' },
    { '<leader>fc', '<cmd>Telescope git_commits<cr>', desc = '[C]ommits' },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = '[D]iagnostics' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '[F]iles' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = '[G]rep' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = '[H]elp' },
    { '<leader>fk', '<cmd>Telescope keymaps<cr>', desc = '[K]eymaps' },
    { '<leader>fr', '<cmd>Telescope resume<cr>', desc = '[R]esume' },
    { '<leader>ft', '<cmd>Telescope builtin<cr>', desc = '[T]elescope' },
    { '<leader>fw', '<cmd>Telescope grep_string<cr>', desc = '[W]ord' },
    { '<leader>f.', '<cmd>Telescope oldfiles<cr>', desc = 'Recent files' },
  },
  config = function()
    require('which-key').add {
      { '<leader>f', group = '[F]ind' },
      { '<leader>f_', hidden = true },
    }

    require('telescope').setup {
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          theme = 'dropdown',
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', 'package-lock.json', '.git', '.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, {
      desc = 'Grep Current Buffer',
    })
  end,
}
