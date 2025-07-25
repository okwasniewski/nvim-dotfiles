return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      custom_surroundings = {
        ['('] = { input = { '%b()', '^.().*().$' }, output = { left = '(', right = ')' } },
        ['['] = { input = { '%b[]', '^.().*().$' }, output = { left = '[', right = ']' } },
        ['{'] = { input = { '%b{}', '^.().*().$' }, output = { left = '{', right = '}' } },
        ['<'] = { input = { '%b<>', '^.().*().$' }, output = { left = '<', right = '>' } },
      },
    }

    require('mini.pairs').setup()
    require('mini.move').setup()
    require('mini.bracketed').setup()

    -- MiniFiles: A file explorer that doesn't suck
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

    local map_split = function(buf_id, lhs, direction)
      local rhs = function()
        -- Make new window and set it as target
        local new_target_window
        vim.api.nvim_win_call(MiniFiles.get_explorer_state().target_window, function()
          vim.cmd(direction .. ' split')
          new_target_window = vim.api.nvim_get_current_win()
        end)

        MiniFiles.set_target_window(new_target_window)
        MiniFiles.go_in()
      end

      -- Adding `desc` will result into `show_help` entries
      local desc = 'Split ' .. direction
      vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
    end

    -- Yank in register full path of entry under cursor
    local yank_path = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify 'Cursor is not on valid entry'
      end
      vim.fn.setreg(vim.v.register, path)
    end

    -- Open path with system default handler (useful for non-text files)
    local ui_open = function()
      vim.ui.open(MiniFiles.get_fs_entry().path)
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesBufferCreate',
      callback = function(args)
        local buf_id = args.data.buf_id
        map_split(buf_id, 'gs', 'belowright horizontal')
        map_split(buf_id, 'gv', 'belowright vertical')
        map_split(buf_id, '<C-t>', 'tab')

        vim.keymap.set('n', 'gy', yank_path, { buffer = buf_id, desc = 'Yank path' })
        vim.keymap.set('n', 'gX', ui_open, { buffer = buf_id, desc = 'OS open' })
      end,
    })
  end,
}
