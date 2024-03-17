-- Set the filetype to `ruby` if file ends with `.podspec` or is named `Podfile`
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.podspec', 'Podfile' },
  callback = function()
    vim.opt.filetype = 'test'
  end,
})

vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function(args)
    if vim.bo.filetype == 'typescript' or vim.bo.filetype == 'typescriptreact' then
      vim.cmd.EslintFixAll()
      return
    end
    require('conform').format { bufnr = args.buf }
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
