return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  build = ":TSUpdate",
  event = "VeryLazy",
  cmd = { "TSUpdate", "TSInstall", "TSUninstall" },
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "bash", "c", "diff", "html", "javascript", "jsdoc", "json",
        "lua", "luadoc", "markdown", "markdown_inline", "python",
        "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc",
        "xml", "yaml", "go",
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ok = pcall(vim.treesitter.start, ev.buf)
        if ok then
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
