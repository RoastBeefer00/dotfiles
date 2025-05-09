return {
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.5",
		-- or                            , branch = '0.1.x',
		dependencies = { {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		} },
		config = function()
			require("telescope").setup()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "[F]ind Todo" })
			vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it files" })
			-- vim.keymap.set('n', '<leader>fs', function()
			--     builtin.grep_string({ search = vim.fn.input("Grep > ") });
			-- end)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
			-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
			vim.keymap.set(
				"n",
				"<leader>ff",
				"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
				{ desc = "[F]ind [F]iles" }
			)
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
			vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "[F]ind by [L]ivegrep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set("n", "<leader>f/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[F]ind [/] in Open Files" })

			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>")
		end,
	},
	"HiPhish/rainbow-delimiters.nvim",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "rust", "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			})
		end,
		dependencies = {
			-- NOTE: additional parser
			-- { "nushell/tree-sitter-nu", build = ":TSUpdate nu" },
		},
	},
	-- {
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	branch = "v2.x",
	-- 	dependencies = {
	-- 		-- LSP Support
	-- 		{
	-- 			"neovim/nvim-lspconfig",
	-- 			config = function()
	-- 				local lsp = require("lsp-zero")
	-- 				require("lspconfig").rust_analyzer.setup({
	-- 					settings = {
	-- 						["rust-analyzer"] = {
	-- 							cargo = {
	-- 								allFeatures = true,
	-- 							},
	-- 							procMacro = {
	-- 								enable = true,
	-- 								-- ignored = {
	-- 								--     leptos_macro = ["server"],
	-- 								-- },
	-- 							},
	-- 							rustfmt = {
	-- 								overrideCommand = {
	-- 									"leptosfmt",
	-- 									"--stdin",
	-- 									"--rustfmt",
	-- 								},
	-- 							},
	-- 						},
	-- 					},
	-- 				})
	-- 				require("lspconfig").html.setup({
	-- 					filetypes = {
	-- 						"html",
	-- 						"templ",
	-- 						"rust",
	-- 						"rs",
	-- 					},
	-- 				})
	-- 				require("lspconfig").htmx.setup({
	-- 					filetypes = {
	-- 						"html",
	-- 						"templ",
	-- 					},
	-- 				})
	-- 				require("lspconfig").tailwindcss.setup({
	-- 					filetypes = {
	-- 						"css",
	-- 						"scss",
	-- 						"sass",
	-- 						"postcss",
	-- 						"html",
	-- 						"javascript",
	-- 						"javascriptreact",
	-- 						"typescript",
	-- 						"typescriptreact",
	-- 						"svelte",
	-- 						"vue",
	-- 						"rust",
	-- 						"rs",
	-- 						"templ",
	-- 					},
	-- 					experimental = {
	-- 						classRegex = {
	-- 							[[class="([^"]*)]],
	-- 							'class=\\s+"([^"]*)',
	-- 						},
	-- 					},
	-- 					init_options = {
	-- 						userLanguages = {
	-- 							eelixir = "html-eex",
	-- 							eruby = "erb",
	-- 							rust = "html",
	-- 							templ = "html",
	-- 						},
	-- 					},
	-- 					root_dir = require("lspconfig").util.root_pattern(
	-- 						"tailwind.config.js",
	-- 						"tailwind.config.ts",
	-- 						"postcss.config.js",
	-- 						"postcss.config.ts",
	-- 						"package.json",
	-- 						"node_modules"
	-- 					),
	-- 				})
	--
	-- 				lsp.preset("recommended")
	--
	-- 				lsp.ensure_installed({
	-- 					"rust_analyzer",
	-- 				})
	--
	-- 				-- Fix Undefined global 'vim'
	-- 				lsp.nvim_workspace()
	--
	-- 				local cmp = require("cmp")
	-- 				local cmp_select = { behavior = cmp.SelectBehavior.Select }
	-- 				local cmp_mappings = lsp.defaults.cmp_mappings({
	-- 					["<S-TAB>"] = cmp.mapping.select_prev_item(cmp_select),
	-- 					["<TAB>"] = cmp.mapping.select_next_item(cmp_select),
	-- 					["<CR>"] = cmp.mapping.confirm({ select = true }),
	-- 					["<C-Space>"] = cmp.mapping.complete(),
	-- 				})
	--
	-- 				cmp.config.formatting = {
	-- 					format = require("tailwindcss-colorizer-cmp").formatter,
	-- 				}
	-- 				cmp_mappings["<Tab>"] = nil
	-- 				cmp_mappings["<S-Tab>"] = nil
	--
	-- 				lsp.setup_nvim_cmp({
	-- 					mapping = cmp_mappings,
	-- 					sources = {
	-- 						{ name = "copilot" },
	-- 						{ name = "nvim_lsp" },
	-- 						{ name = "luasnip" },
	-- 						{ name = "path" },
	-- 						-- { name = "codeium" },
	-- 					},
	-- 				})
	--
	-- 				lsp.set_preferences({
	-- 					suggest_lsp_servers = false,
	-- 					sign_icons = {
	-- 						error = "E",
	-- 						warn = "W",
	-- 						hint = "H",
	-- 						info = "I",
	-- 					},
	-- 				})
	--
	-- 				lsp.on_attach(function(client, bufnr)
	-- 					local opts = { buffer = bufnr, remap = false }
	--
	-- 					vim.keymap.set("n", "gd", function()
	-- 						vim.lsp.buf.definition()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "K", "I", opts)
	-- 					vim.keymap.set("n", "<leader>H", function()
	-- 						vim.lsp.buf.hover()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "<leader>vws", function()
	-- 						vim.lsp.buf.workspace_symbol()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "<leader>vd", function()
	-- 						vim.diagnostic.open_float()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "]d", function()
	-- 						vim.diagnostic.goto_next()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "[d", function()
	-- 						vim.diagnostic.goto_prev()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "<leader>ca", function()
	-- 						vim.lsp.buf.code_action()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "<leader>rr", function()
	-- 						vim.lsp.buf.references()
	-- 					end, opts)
	-- 					vim.keymap.set("n", "<leader>rn", function()
	-- 						vim.lsp.buf.rename()
	-- 					end, opts)
	-- 					vim.keymap.set("i", "<C-h>", function()
	-- 						vim.lsp.buf.signature_help()
	-- 					end, opts)
	-- 				end)
	--
	-- 				lsp.setup()
	--
	-- 				vim.diagnostic.config({
	-- 					virtual_text = true,
	-- 				})
	-- 			end,
	-- 		}, -- Required
	--
	-- 		{ -- Optional
	-- 			"williamboman/mason.nvim",
	-- 			build = function()
	-- 				pcall(vim.cmd, "MasonUpdate")
	-- 			end,
	-- 		},
	-- 		{ "williamboman/mason-lspconfig.nvim" }, -- Optional
	--
	-- 		-- Autocompletion
	-- 		{ "hrsh7th/nvim-cmp" }, -- Required
	-- 		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
	-- 		{ "L3MON4D3/LuaSnip" }, -- Required
	-- 		{ "hrsh7th/cmp-path" },
	-- 	},
	-- },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	"sQVe/sort.nvim",
	-- "christoomey/vim-tmux-navigator",
	"mrjones2014/smart-splits.nvim",
}
