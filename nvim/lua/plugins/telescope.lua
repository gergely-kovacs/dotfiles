return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/noice.nvim',
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
  config = function()
    require('which-key').register {
      ['<leader>f'] = {
        name = '[F]ind',
        _ = 'which_key_ignore',
      },
    }

    require('telescope').setup {
      -- defaults = {
      --   mappings = {
      --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
      --   },
      -- },
      -- pickers = {}
      extensions = {},
    }
    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'session-lens')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
      desc = '[H]elp',
    })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, {
      desc = '[K]eymaps',
    })
    vim.keymap.set('n', '<leader>ff', '<cmd>lua require "telescope.builtin".find_files { hidden = true }<cr>', {
      desc = '[F]iles',
    })
    vim.keymap.set('n', '<leader>ft', builtin.builtin, {
      desc = '[T]elescope',
    })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, {
      desc = '[W]ord (current)',
    })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
      desc = '[G]rep',
    })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {
      desc = '[D]iagnostics',
    })
    vim.keymap.set('n', '<leader>fr', builtin.resume, {
      desc = '[R]esume',
    })
    vim.keymap.set('n', '<leader>f.', builtin.oldfiles, {
      desc = 'Recent Files',
    })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, {
      desc = 'Find existing buffers',
    })

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

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, {
      desc = 'Grep Open Files',
    })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fn', function()
      builtin.find_files {
        cwd = vim.fn.stdpath 'config',
      }
    end, {
      desc = '[N]eovim Files',
    })
  end,
}
