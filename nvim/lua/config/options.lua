-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable if you have a font patched with UTF icons
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- For more options, you can see `:help option-list`

-- 24 bit colors enabled
vim.opt.termguicolors = true

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- What should be included in saved sessions
vim.opt.sessionoptions = 'buffers,curdir,folds,localoptions,globals,tabpages'

-- Sync clipboard between OS and Neovim.
-- See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 200

-- Displays which-key popup sooner
-- vim.opt.timeout = false
vim.opt.timeoutlen = 25

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
-- and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', lead = '·', trail = '·', multispace = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 12

-- Max entries in the popup menu
vim.opt.pumheight = 10

-- Set highlight on search, remove highlight with <esc>
vim.opt.hlsearch = true

-- Modeline settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Diagnostics
vim.diagnostic.config {
  float = {
    border = 'rounded',
  },
}

-- Autostart godothost
local gdproject = io.open(vim.fn.getcwd() .. '/project.godot', 'r')
if gdproject then
  io.close(gdproject)
  vim.fn.serverstart './godothost'
end
