return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }

      vim.treesitter.language.register('objc', 'objective-cpp')
      vim.treesitter.language.register('objc', 'objective-c')
    end,
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', opts = {} },
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
}