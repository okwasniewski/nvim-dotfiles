return {
  'mfussenegger/nvim-dap',
  event = 'BufRead',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    {
      'microsoft/vscode-js-debug',
      build = 'npm i && npm run compile vsDebugServerBundle && rm -rf out && mv -f dist out',
      version = '1.91.0',
    },
    {
      'mxsdev/nvim-dap-vscode-js',
      opts = {
        debugger_path = vim.fn.resolve(vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug'),
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      },
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local virtual_text = require 'nvim-dap-virtual-text'

    vim.keymap.set('n', '<F5>', dap.continue)
    vim.keymap.set('n', '<F10>', dap.step_over)
    vim.keymap.set('n', '<F11>', dap.step_into)
    vim.keymap.set('n', '<F12>', dap.step_out)
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)

    dapui.setup()
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open {}
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close {}
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close {}
    end

    local js_based_languages = { 'typescript', 'javascript', 'typescriptreact' }
    dap.configurations.typescript = dap.configurations.javascript

    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },

        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        -- Debug web applications (client side)
        {
          name = 'Launch & Debug Chrome',
          type = 'pwa-chrome',
          request = 'launch',
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({ prompt = 'Enter URL: ', default = 'http://localhost:3000' }, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = 'inspector',
          sourceMaps = true,
          userDataDir = false,
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
        },

        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Start Chrome with "localhost"',
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({ prompt = 'Enter URL: ', default = 'http://localhost:3000' }, function(url)
                if url == nil or url == '' then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          protocol = 'inspector',
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          webRoot = vim.fn.getcwd(),
          userDataDir = false,
        },
      }

      dapui.setup()
      virtual_text.setup {}
    end
  end,
}
