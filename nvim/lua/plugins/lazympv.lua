return {
  -- "plsdev89/lazympv.nvim",
  dir = "~/dotfiles/nvim/lua/plugins/lazympv.nvim",
  lazy = false,
  config = function()
    require("lazympv").setup()
  end,
}
