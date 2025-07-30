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

vim.keymap.set('n', '<leader>gc', function()
  if vim.t.diffview_view_initialized then
    return vim.cmd.DiffviewClose()
  end
  return vim.cmd.DiffviewOpen()
end, { desc = 'Toggle diffview' })

vim.keymap.set('n', '<leader>gh', function()
  vim.cmd.DiffviewFileHistory()
end, { desc = 'Open file history' })

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
  { 'sindrets/diffview.nvim', version = '*', opts = {
    view = {
      merge_tool = {
        layout = 'diff3_mixed',
      },
    },
  } },
}
