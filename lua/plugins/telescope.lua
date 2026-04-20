return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			-- Disabled: causes input freezing in live_grep even after clean rebuild
			enabled = false,
			build = vim.fn.executable("cmake") == 1
					and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
				or "make",
			config = function(plugin)
				local ok, err = pcall(require("telescope").load_extension, "fzf")
				if not ok then
					local lib = plugin.dir .. "/build/libfzf.so"
					if not vim.uv.fs_stat(lib) then
						vim.notify(
							"telescope-fzf-native.nvim not built. Run :Lazy build telescope-fzf-native.nvim",
							vim.log.levels.WARN
						)
					else
						vim.notify("Failed to load telescope-fzf-native.nvim:\n" .. err, vim.log.levels.ERROR)
					end
				end
			end,
		},
	},
	keys = {
		{ "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" },
		{
			"<leader>/",
			function()
				require("telescope.builtin").live_grep({ cwd = require("util.root").get() })
			end,
		},
		{ "<leader>:", "<cmd>Telescope command_history<cr>" },
		{
			"<leader><space>",
			function()
				require("telescope.builtin").find_files({ cwd = require("util.root").get() })
			end,
			desc = "Find Files (Root Dir)",
		},
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ cwd = vim.uv.cwd() })
			end,
		},
		{ "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>" },
		{ "<leader>fB", "<cmd>Telescope buffers<cr>" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>" },
		{ "<leader>gS", "<cmd>Telescope git_stash<cr>" },
		{ '<leader>s"', "<cmd>Telescope registers<cr>" },
		{ "<leader>s/", "<cmd>Telescope search_history<cr>" },
		{ "<leader>sa", "<cmd>Telescope autocommands<cr>" },
		{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
		{ "<leader>sc", "<cmd>Telescope command_history<cr>" },
		{ "<leader>sC", "<cmd>Telescope commands<cr>" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>" },
		{ "<leader>sD", "<cmd>Telescope diagnostics bufnr=0<cr>" },
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep({ cwd = require("util.root").get() })
			end,
		},
		{
			"<leader>sG",
			function()
				require("telescope.builtin").live_grep({ cwd = vim.uv.cwd() })
			end,
		},
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>sH", "<cmd>Telescope highlights<cr>" },
		{ "<leader>sj", "<cmd>Telescope jumplist<cr>" },
		{ "<leader>sk", "<cmd>Telescope keymaps<cr>" },
		{ "<leader>sl", "<cmd>Telescope loclist<cr>" },
		{ "<leader>sM", "<cmd>Telescope man_pages<cr>" },
		{ "<leader>sm", "<cmd>Telescope marks<cr>" },
		{ "<leader>so", "<cmd>Telescope vim_options<cr>" },
		{ "<leader>sR", "<cmd>Telescope resume<cr>" },
		{ "<leader>sq", "<cmd>Telescope quickfix<cr>" },
		{
			"<leader>sw",
			function()
				require("telescope.builtin").grep_string({ cwd = require("util.root").get(), word_match = "-w" })
			end,
		},
		{
			"<leader>sW",
			function()
				require("telescope.builtin").grep_string({ cwd = vim.uv.cwd(), word_match = "-w" })
			end,
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").grep_string({ cwd = require("util.root").get() })
			end,
			mode = "x",
		},
		{
			"<leader>sW",
			function()
				require("telescope.builtin").grep_string({ cwd = vim.uv.cwd() })
			end,
			mode = "x",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
		},
		{
			"<leader>sS",
			function()
				require("telescope.builtin").lsp_dynamic_workspace_symbols()
			end,
		},
		{
			"<leader>uC",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
		},
	},
	config = function()
		local actions = require("telescope.actions")

		local function find_command()
			if 1 == vim.fn.executable("rg") then
				return { "rg", "--files", "--color", "never", "-g", "!.git" }
			elseif 1 == vim.fn.executable("fd") then
				return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
			elseif 1 == vim.fn.executable("fdfind") then
				return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
			elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
				return { "find", ".", "-type", "f" }
			elseif 1 == vim.fn.executable("where") then
				return { "where", "/r", ".", "*" }
			end
		end

		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				get_selection_window = function()
					local wins = vim.api.nvim_list_wins()
					table.insert(wins, 1, vim.api.nvim_get_current_win())
					for _, win in ipairs(wins) do
						local buf = vim.api.nvim_win_get_buf(win)
						if vim.bo[buf].buftype == "" then
							return win
						end
					end
					return 0
				end,
				mappings = {
					i = {
						["<C-Down>"] = actions.cycle_history_next,
						["<C-Up>"] = actions.cycle_history_prev,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
					n = {
						["q"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = find_command,
					hidden = true,
				},
				live_grep = {
					additional_args = function()
						return {
							"--max-filesize=1M",
							"--max-columns=500",
						}
					end,
				},
			},
		})
	end,
}
