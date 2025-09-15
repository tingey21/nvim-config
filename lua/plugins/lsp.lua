return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("go.work", "go.mod", ".git", "Chart.yaml")(fname)
          end,
          settings = {
            gopls = {
              completeUnimported = true,
              usePlaceholders = true,
              analyses = {
                unusedparams = true,
              },
              templateExtensions = { "tpl", "yaml", "yml", "gotmpl" },
            },
          },
        },
        -- Add helm-ls if available
        helm_ls = {
          filetypes = { "helm" },
          cmd = { "helm_ls", "serve" },
          root_dir = function(fname)
            local util = require("lspconfig.util")
            return util.root_pattern("Chart.yaml", "Chart.yml")(fname)
          end,
        },
      },
    },
  },
}

