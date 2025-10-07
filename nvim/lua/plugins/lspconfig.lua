return {
  "neovim/nvim-lspconfig",
  config = function()
    -- load defaults i.e lua_lsp
    require("nvchad.configs.lspconfig").defaults()

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
        filetypes = { "python" },
        root_markers = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfig.json",
          ".git",
        },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
              typeCheckingMode = "off",
            },
          },
        },
      },
      ts_ls = {
        init_options = {
          hostInfo = "neovim",
          preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
            diagnostics = {
              enable = true,
            },
          },
        },
        root_dir = function(fname)
          return util.root_pattern("Cargo.toml", "rust-project.json")(fname)
        end,
      },
    }
    local configs = require "nvchad.configs.lspconfig"

    for name, opts in pairs(servers) do
      opts.on_init = configs.on_init
      opts.on_attach = configs.on_attach
      opts.capabilities = configs.capabilities

      -- Use new vim.lsp.config format
      vim.lsp.config(name, opts)
      vim.lsp.enable(name)
    end
  end,
}
