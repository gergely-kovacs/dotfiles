return {
  'ibhagwan/fzf-lua',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    files = {
      hidden = true,
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --glob '!package-lock.json' --max-columns=4096 -e",
    },
    winopts = {
      border = 'rounded',
      preview = {
        default = 'bat',
        border = 'rounded',
      },
    },
  },
  ---@diagnostic enable: missing-fields
  keys = {
    { '<leader><leader>', '<cmd>FzfLua buffers<cr>', desc = '<FZF> Buffers' },
    { '<leader>/', '<cmd>FzfLua blines<cr>', desc = '<FZF> Current Buffer Lines' },
    { '<leader>fc', '<cmd>FzfLua git_bcommits<cr>', desc = '[C]ommits (File)' },
    { '<leader>fC', '<cmd>FzfLua git_commits<cr>', desc = 'Commits (Repo)' },
    { '<leader>fd', '<cmd>FzfLua diagnostics_workspace<cr>', desc = '[D]iagnostics' },
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = '[F]iles' },
    { '<leader>fg', '<cmd>FzfLua live_grep<cr>', desc = '[G]rep' },
    { '<leader>fh', '<cmd>FzfLua helptags<cr>', desc = '[H]elp' },
    { '<leader>fk', '<cmd>FzfLua keymaps<cr>', desc = '[K]eymaps' },
    { '<leader>fr', '<cmd>FzfLua resume<cr>', desc = '[R]esume' },
    { '<leader>fb', '<cmd>FzfLua builtin<cr>', desc = '[B]uilt-in commands' },
    { '<leader>fw', '<cmd>FzfLua grep_cword<cr>', desc = '[W]ord' },
    { '<leader>f.', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent files' },
  },
  config = function(_, opts)
    require('which-key').add {
      { '<leader>f', group = '[F]ind' },
      { '<leader>f_', hidden = true },
    }

    require('fzf-lua').setup(opts)
  end,
}
