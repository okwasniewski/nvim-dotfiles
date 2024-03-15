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
  {
    'sindrets/diffview.nvim',
    setup = function()
      require('diffview').setup()
    end,
  },
}
