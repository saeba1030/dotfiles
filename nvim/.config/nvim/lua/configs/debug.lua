local dap = require 'dap'
local dapui = require 'dapui'

require('neodev').setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

-- Adapter setup
dap.adapters.cppvsdbg = {
  type = 'executable',
  command = vim.fn.exepath('lldb-vscode.exe'),
  name = 'lldb'
}

-- Configurations setup
-- Non-standard .vscode/launch.json (trail comma in last item) will cause loading failure.
-- require('dap.ext.vscode').load_launchjs(nil, { cppvsdbg = { 'c', 'cpp' } })
require('dap.ext.vscode').load_launchjs(nil, nil)
if dap.configurations.cppvsdbg then
  -- Windows
  dap.configurations.cpp = dap.configurations.cppvsdbg
  dap.configurations.c = dap.configurations.cppvsdbg
else
  -- Linux / OSX
  dap.configurations.cpp = dap.configurations.cppdbg
  dap.configurations.c = dap.configurations.cppdbg
end

-- TODO: Setup external terminal. Not working now.
-- dap.defaults.fallback.external_terminal = {
--   command = vim.fn.exepath('cmd.exe'),
--   args = { '/c' }
-- }

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<C-F10>', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<C-F9>', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  --    Feel free to remove or use ones that you like more! :)
  --    Don't feel like these are good choices.
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
}

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close
