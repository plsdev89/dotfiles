return {
  "hedyhli/outline.nvim",
  keys = {
    { "<leader>o", "<cmd>Outline<cr>", desc = "Outline" },
  },
  config = function()
    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
      auto_close = true, -- Automatically close the outline when focusing another window
      auto_preview = false, -- Disable automatic preview of symbols
      highlight_hovered_item = true, -- Highlight the currently hovered item in the outline
      show_guides = true, -- Show guides for nested symbols
    }
  end,
}
