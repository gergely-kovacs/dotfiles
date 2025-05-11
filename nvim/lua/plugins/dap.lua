return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    {
      'theHamsta/nvim-dap-virtual-text',
      keys = {
        { '<leader>dv', '<cmd>DapVirtualTextToggle<cr>', desc = '[V]irtual Text Toggle' },
      },
      opts = {
        commented = true,
      },
    },
    {
      'leoluz/nvim-dap-go',
      ft = 'go',
    },
    {
      'mfussenegger/nvim-dap-python',
      ft = 'python',
    },
  },
  keys = {
    {
      '<F1>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F4>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<F5>',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: Toggle UI.',
    },
    {
      '<F6>',
      function()
        require('dap').run_last()
      end,
      desc = 'Debug: Run Last',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = '[B]reakpoint toggle',
    },
    {
      '<leader>dB',
      function()
        local input = vim.fn.input 'Breakpoint condition: '
        require('dap').set_breakpoint(input)
      end,
      desc = 'Breakpoint (conditional)',
    },
  },
  config = function()
    require('which-key').add {
      { '<leader>d', group = '[D]ebug' },
      { '<leader>d_', hidden = true },
    }

    local dap = require 'dap'
    local dapui = require 'dapui'

    -- For more information, see |:help nvim-dap-ui|
    ---@diagnostic disable-next-line: missing-fields
    dapui.setup {}

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    require('dap-python').setup()
  end,
}
