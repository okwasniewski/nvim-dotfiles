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
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
    }

    vim.keymap.set('n', '<leader>oa', '<cmd>ObsidianOpen<CR>', { desc = 'Open note in Obsidian' })
    vim.keymap.set('n', '<leader>oq', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Toggle Quick Switch' })
    vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks<CR>', { desc = 'Open Backlinks' })
    vim.keymap.set('n', '<leader>ot', '<cmd>ObsidianToday<CR>', { desc = 'Open Today' })
    vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNewFromTemplate<CR>', { desc = 'New note from Template' })
    vim.keymap.set('n', '<leader>oe', '<cmd>ObsidianNew<CR>', { desc = 'New note' })
  end,
}
