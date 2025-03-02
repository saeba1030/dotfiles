return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    delete_to_trash = false,
    float = {
      preview_split = 'right',
    },
  },
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", version = false, opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  -- Key bindings
  keys = {
    -- { "-", "<cmd>Oil --float<cr>", desc = "Open parent directory" },
    { "<leader>e", "<cmd>Oil --float<cr>", desc = "Open current directory" },
  },
}
