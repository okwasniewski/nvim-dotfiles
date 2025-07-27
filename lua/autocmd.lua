-- Set the filetype to `ruby` if file ends with `.podspec` or is named `Podfile`
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.podspec', 'Podfile' },
  callback = function()
    vim.opt.filetype = 'ruby'
  end,
})

vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function(args)
    -- Check if EslintFixAll command exists
    if vim.fn.exists ':EslintFixAll' == 2 then
      vim.cmd.EslintFixAll()
    end

    vim.cmd.Neoformat()
  end,
})

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.mm' },
  callback = function()
    vim.opt.filetype = 'objective-cpp'
  end,
})

vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*.m' },
  callback = function()
    vim.opt.filetype = 'objective-c'
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
