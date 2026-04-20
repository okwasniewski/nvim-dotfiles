local is_nvim_012 = vim.fn.has 'nvim-0.12' == 1

local treesitter = {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    if is_nvim_012 then
      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath 'data' .. '/site',
      }

      local group = vim.api.nvim_create_augroup('nvim-treesitter-setup', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    else
      local ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }

      require('nvim-treesitter.configs').setup {
        ensure_installed = ensure_installed,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end

    vim.treesitter.language.register('objc', 'objective-cpp')
    vim.treesitter.language.register('objc', 'objective-c')
  end,
}

if not is_nvim_012 then
  treesitter.branch = 'master'
end

return {
  treesitter,
  { 'JoosepAlviste/nvim-ts-context-commentstring', opts = {} },
  {
    'windwp/nvim-ts-autotag',
    opts = {},
  },
}
