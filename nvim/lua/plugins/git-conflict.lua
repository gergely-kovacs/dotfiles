return {
  'akinsho/git-conflict.nvim',
  version = '*',
  event = 'BufReadPre',
  config = true,
  --[[ default keymap
  co — choose ours
  ct — choose theirs
  cb — choose both
  c0 — choose none
  ]x — move to previous conflict
  [x — move to next conflict
  ]]
}
