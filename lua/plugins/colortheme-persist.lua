return {
  "tingey21/telescope-colorscheme-persist",
  -- dir = vim.fn.stdpath("config") .. "/lua/telescope-colorscheme-persist",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  config = function()
    require("telescope-colorscheme-persist").setup({
      debug = false,
    })
  end,
}
