return {
  "someone-stole-my-name/yaml-companion.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  config = function()
    require("telescope").load_extension("yaml_schema")
  end,
}
