return { {
  'nvim-telescope/telescope.nvim',
  -- your existing dependencies, keys, cmd, etc.
  opts = function(_, opts)
    -- Merge with existing defaults
    opts.defaults = opts.defaults or {}
    opts.defaults.file_ignore_patterns = vim.list_extend(
      opts.defaults.file_ignore_patterns or {},
      {
        "%.yarn/cache/",
        "node_modules/",
      }
    )
    return opts
  end,
} }
