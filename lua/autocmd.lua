-- Automatically format on save
vim.api.nvim_create_autocmd({ 'BufWrite' }, {
  callback = function(args)
    -- Check if EslintFixAll command exists
    if vim.fn.exists ':EslintFixAll' == 2 then
      vim.cmd.EslintFixAll()
    end

    vim.cmd.Neoformat()
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically reload files when they change on disk
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    -- Check if the current buffer is a normal file (not special buffers)
    if vim.bo.buftype == '' and vim.fn.filereadable(vim.fn.expand '%') == 1 then
      vim.cmd 'checktime'
    end
  end,
  desc = 'Reload file when terminal gains focus',
})
