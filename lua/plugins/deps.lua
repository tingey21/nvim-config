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
      local logo = [[
 ________  ________  ________  ________          _________  ___  ________   ________  ________      
|\   __  \|\   __  \|\   __  \|\   __  \        |\___   ___\\  \|\   ___  \|\   ____\|\   ____\     
\ \  \|\  \ \  \|\  \ \  \|\  \ \  \|\  \       \|___ \  \_\ \  \ \  \\ \  \ \  \___|\ \  \___|_    
 \ \   ____\ \   __  \ \   ____\ \   __  \           \ \  \ \ \  \ \  \\ \  \ \  \  __\ \_____  \   
  \ \  \___|\ \  \ \  \ \  \___|\ \  \ \  \           \ \  \ \ \  \ \  \\ \  \ \  \|\  \|____|\  \  
   \ \__\    \ \__\ \__\ \__\    \ \__\ \__\           \ \__\ \ \__\ \__\\ \__\ \_______\____\_\  \ 
    \|__|     \|__|\|__|\|__|     \|__|\|__|            \|__|  \|__|\|__| \|__|\|_______|\_________\
                                                                                        \|_________|
                                                                                                    
    ]]
      opts.theme = "hyper"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right" },
    },
  },
}
