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
    {
      'nvim-telescope/telescope-live-grep-args.nvim',
      version = '^1.0.0',
    },
  },
  keys = {
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = '[B]uffers' },
    { '<leader>fc', '<cmd>Telescope git_bcommits<cr>', desc = '[C]ommits (File)' },
    { '<leader>fC', '<cmd>Telescope git_commits<cr>', desc = 'Commits (Repo)' },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = '[D]iagnostics' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = '[F]iles' },
    -- { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = '[G]rep' },
    { '<leader>fg', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', desc = '[G]rep' },
    { '<leader>fl', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = '[L]ines' },
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

    local telescope = require 'telescope'

    telescope.setup {
      extensions = {
        fzf = {},
        live_grep_args = {
          auto_quoting = false,
          theme = 'ivy',
          file_ignore_patterns = { 'package%-lock%.json' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
      pickers = {
        current_buffer_fuzzy_find = {
          theme = 'dropdown',
        },
        find_files = {
          theme = 'dropdown',
          hidden = true,
        },
      },
    }

    telescope.load_extension 'fzf'
  end,
}
