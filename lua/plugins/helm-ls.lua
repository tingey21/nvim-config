return {
	"qvalentin/helm-ls.nvim",
	ft = "helm",
	config = function()
		vim.lsp.config("helm_ls", {
			settings = {
				["helm-ls"] = {
					yamlls = {
						path = "yaml-language-server",
					},
				},
			},
		})
		vim.lsp.enable("helm_ls")
	end,
}
