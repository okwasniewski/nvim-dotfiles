vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function(args)
    -- Check if EslintFixAll command exists
    if vim.fn.exists ':EslintFixAll' == 2 then
      vim.cmd.EslintFixAll()
    end

    vim.cmd.Neoformat()
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
