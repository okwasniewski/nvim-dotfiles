return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd.colorscheme 'tokyonight-night'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd.colorscheme 'rose-pine'
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
}
