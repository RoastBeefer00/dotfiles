return {
  'stevearc/oil.nvim',
  opts = {},
  config = function()
      require("oil").setup({
          vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
          view_options = {
              show_hidden = true
          }
      })
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
