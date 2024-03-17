return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      log_level = 'error',
      pre_save_cmds = { 'Neotree close' },
      post_restore_cmds = { 'Neotree filesystem show' },
    }
  end,
}
