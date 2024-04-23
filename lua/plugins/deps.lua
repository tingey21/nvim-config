-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "numToStr/Comment.nvim" },
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      opts.config.header = {
        "",
        "  ███████╗██╗██████╗ ███████╗████████╗██╗    ██╗ ██████╗ ██████╗ ██████╗ ",
        "  ██╔════╝██║██╔══██╗██╔════╝╚══██╔══╝██║    ██║██╔═══██╗██╔══██╗██╔══██╗",
        "  █████╗  ██║██████╔╝███████╗   ██║   ██║ █╗ ██║██║   ██║██████╔╝██║  ██║",
        "  ██╔══╝  ██║██╔══██╗╚════██║   ██║   ██║███╗██║██║   ██║██╔══██╗██║  ██║",
        "  ██║     ██║██║  ██║███████║   ██║   ╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝",
        "  ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝    ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ",
        "",
        "",
      }
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right" },
    },
  },
}
