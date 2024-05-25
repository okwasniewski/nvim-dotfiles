return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          },
        },
        -- Remove file encoding and file format
        lualine_x = { 'filetype' },
      },
    }
  end,
}
