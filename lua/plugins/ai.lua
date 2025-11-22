return {
  'github/copilot.vim',
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        provider = {
          enabled = 'tmux', -- Default if inside a `tmux` session.
          tmux = {
            options = '-h -p 35',
          },
        },
      }

      vim.o.autoread = true

      vim.keymap.set({ 'n', 'x' }, '<C-a>', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = 'Ask opencode' })

      vim.keymap.set({ 'n', 'x' }, '<leader>ax', function()
        require('opencode').select()
      end, { desc = 'Execute opencode action…' })

      vim.keymap.set({ 'n', 'x' }, 'ga', function()
        require('opencode').prompt '@this'
      end, { desc = 'Add to opencode' })

      vim.keymap.set({ 'n', 't' }, '<leader>ao', function()
        require('opencode').toggle()
      end, { desc = 'Toggle opencode' })
    end,
  },
}
