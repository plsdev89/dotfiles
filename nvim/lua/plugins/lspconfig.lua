return {
  "neovim/nvim-lspconfig",
  config = function()
    -- load defaults i.e lua_lsp
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"
    local util = require "lspconfig.util"

    -- EXAMPLE
    local servers = {
      html = {},
      cssls = {},
      tailwindcss = {
        root_dir = function(...)
          return require("lspconfig.util").root_pattern "tailwind.config.ts"(...)
        end,
      },
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              typeCheckingMode = "off",
            },
          },
        },
        root_dir = function(fname)
          return util.root_pattern(".git", "manage.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
            or util.path.dirname(fname)
        end,
      },
      ts_ls = {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
      },
    }
    local configs = require "nvchad.configs.lspconfig"

    for name, opts in pairs(servers) do
      opts.on_init = configs.on_init
      opts.on_attach = configs.on_attach
      opts.capabilities = configs.capabilities

      lspconfig[name].setup(opts)
    end
  end,
}
