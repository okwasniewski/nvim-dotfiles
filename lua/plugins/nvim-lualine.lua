return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        -- Remove file encoding and file format
        lualine_x = { 'filetype' },
      },
    }
  end,
}
