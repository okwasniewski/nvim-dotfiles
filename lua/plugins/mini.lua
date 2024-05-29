return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.files').setup {
      mappings = {
        synchronize = '<CR>',
        go_in_plus = 'l',
      },
      windows = {
        preview = true,
      },
    }
    vim.keymap.set('n', '<leader>e', function()
      MiniFiles.open()
    end, { desc = 'Open MiniFiles' })
  end,
}
