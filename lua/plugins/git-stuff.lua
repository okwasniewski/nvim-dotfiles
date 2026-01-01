-- NOTE: Git keymaps
vim.keymap.set('n', '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Open LazyGit' })

vim.keymap.set('n', '<leader>gb', function()
  vim.cmd.Gitsigns 'blame_line'
end, { desc = 'Blame line' })

vim.keymap.set('n', '<leader>ga', function()
  vim.cmd.Gitsigns 'blame'
end, { desc = 'Blame' })

-- Diff keymaps
vim.keymap.set('n', '<leader>gd', '<cmd>CodeDiff<cr>', { desc = 'Diff explorer (changed files)' })
vim.keymap.set('n', '<leader>gD', '<cmd>CodeDiff file HEAD<cr>', { desc = 'Diff file vs HEAD' })
vim.keymap.set('n', '<leader>gh', function()
  require('fzf-lua').git_branches {
    actions = {
      ['default'] = function(selected)
        local branch = selected[1]:match '%S+'
        vim.cmd('CodeDiff ' .. branch)
      end,
    },
  }
end, { desc = 'Diff vs branch' })

return {
  {
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
  },
  {
    'esmuellert/vscode-diff.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    cmd = 'CodeDiff',
    keys = {
      { '<leader>gd', '<cmd>CodeDiff<cr>', desc = 'Diff explorer' },
      { '<leader>gD', '<cmd>CodeDiff file HEAD<cr>', desc = 'Diff file vs HEAD' },
    },
    opts = {
      explorer = {
        position = 'left',
        width = 25,
        view_mode = 'tree',
      },
    },
  },
}
