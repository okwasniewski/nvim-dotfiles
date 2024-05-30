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
    vim.keymap.set('n', '<C-e>', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0))
    end, { desc = 'Open MiniFiles' })
  end,
}
