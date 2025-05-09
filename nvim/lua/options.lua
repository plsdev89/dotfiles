require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

local autocmd = vim.api.nvim_create_autocmd

-- Restore cursor
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- Reload buffer when file is changed outside.
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

vim.wo.relativenumber = true

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

if vim.fn.getenv "TERM_PROGRAM" == "ghostty" then
  vim.opt.title = true
  vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
end
