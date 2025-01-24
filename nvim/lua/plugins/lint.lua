return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre" },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      lua = { "luacheck" },
      python = { "flake8" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    lint.linters.luacheck.args = {
      "--globals",
      "love",
      "vim",
      "--formatter",
      "plain",
      "--codes",
      "--ranges",
      "-",
    }
    lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
      -- try to ignore "No ESLint configuration found" error
      -- if diagnostic.message:find("Error: No ESLint configuration found") then -- old version
      -- update: 20240814, following is working
      if diagnostic.message:find "Error: Could not find config file" then
        return nil
      end
      return diagnostic
    end)

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
