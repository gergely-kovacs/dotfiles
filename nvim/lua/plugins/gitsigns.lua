return {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  opts = {
    attach_to_untracked = true,
    preview_config = {
      border = 'rounded',
      row = 1,
    },
    signs = {
      add = { text = '▎' },
      change = { text = '▎' },
      delete = { text = '' },
      topdelete = { text = '' },
      changedelete = { text = '▎' },
      untracked = { text = '▎' },
    },
  },
  init = function()
    local gs = require 'gitsigns'

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { desc = desc })
    end

    -- stylua: ignore start
    map("n", "]h", function() gs.nav_hunk("next") end, "Next Hunk")
    map("n", "[h", function() gs.nav_hunk("prev") end, "Prev Hunk")
    map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
    map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
    map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "[S]tage Hunk")
    map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "[R]eset Hunk")
    map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
    map("n", "<leader>gp", gs.preview_hunk, "[P]review Hunk Inline")
    map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "[B]lame Line")
    map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle Current Line Blame")
    map("n", "<leader>gd", gs.diffthis, "[D]iff This")
    map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
  end,
}
