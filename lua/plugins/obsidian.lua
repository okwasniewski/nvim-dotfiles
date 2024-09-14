return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local obsidian = require 'obsidian'
    obsidian.setup {
      workspaces = {
        {
          name = 'personal',
          path = '~/Personal',
        },
      },
      notes_subdir = 'inbox',
      daily_notes = {
        folder = 'notes/daily_notes',
        template = 'notes/templates/daily_note_template.md',
      },
      templates = {
        folder = 'notes/templates',
      },
    }

    vim.keymap.set('n', '<leader>oa', '<cmd>ObsidianOpen<CR>', { desc = 'Open note in Obsidian' })
    vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Toggle Quick Switch' })
    vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Open Backlinks' })
    vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = 'Open Today' })
    vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNewFromTemplate<CR>', { desc = 'New note from Template' })
    vim.keymap.set('n', '<leader>oe', '<cmd>ObsidianNew<CR>', { desc = 'New note' })
  end,
}
