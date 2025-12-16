-- NOTE: Git keymaps
vim.keymap.set('n', '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Open LazyGit' })

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
      current_line_blame = true,
    },
    setup = function()
      require('gitsigns').setup()
    end,
  },
  {
    'esmuellert/vscode-diff.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    cmd = 'CodeDiff',
  },
}
