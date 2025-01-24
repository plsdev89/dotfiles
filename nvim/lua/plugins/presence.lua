return {
  "andweeb/presence.nvim",
  lazy = false,
  opts = {
    auto_update = true, -- Update presence info every time you edit a file
    neovim_image_text = "Neovim IDE", -- Text displayed under the Neovim logo
    main_image = "file", -- Main image display ('neovim' or 'file')
    debounce_timeout = 10, -- Delay before updating presence (in seconds)
    enable_line_number = true, -- Show line numbers in the Rich Presence
    editing_text = "Editing %s", -- Format for editing text
    file_explorer_text = "Browsing %s", -- Format for file explorer text
    git_commit_text = "Committing changes", -- Format for Git commit text
  },
}
