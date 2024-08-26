-- NOTE: Git keymaps
vim.keymap.set('n', '<leader>gg', function()
  vim.cmd.LazyGit()
end, { desc = 'Open LazyGit' })

vim.keymap.set('n', '<leader>gd', function()
  vim.cmd.DiffviewOpen()
end, { desc = 'Open diff view' })

vim.keymap.set('n', '<leader>gp', function()
  vim.cmd.Gitsigns 'preview_hunk'
end, { desc = 'Preview hunk' })

vim.keymap.set('n', '<leader>gb', function()
  vim.cmd.Gitsigns 'blame_line'
end, { desc = 'Blame line' })

vim.keymap.set('n', '<leader>ga', function()
  vim.cmd.Gitsigns 'blame'
end, { desc = 'Blame line' })

return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
    setup = function()
      require('gitsigns').setup()
    end,
  },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
  {
    'sindrets/diffview.nvim',
    setup = function()
      require('diffview').setup()
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
}
