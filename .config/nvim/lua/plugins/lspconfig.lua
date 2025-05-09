return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		require("lspconfig").rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
					procMacro = {
						enable = true,
						-- ignored = {
						--     leptos_macro = ["server"],
						-- },
					},
					rustfmt = {
						overrideCommand = {
							"leptosfmt",
							"--stdin",
							"--rustfmt",
						},
					},
				},
			},
		})
		require("lspconfig").html.setup({
			capabilities = capabilities,
			filetypes = {
				"html",
				"templ",
				"rust",
				"rs",
			},
		})
		require("lspconfig").htmx.setup({
			capabilities = capabilities,
			filetypes = {
				"html",
				"templ",
			},
		})
		require("lspconfig").tailwindcss.setup({
			capabilities = capabilities,
			filetypes = {
				"css",
				"scss",
				"sass",
				"postcss",
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"vue",
				"rust",
				"rs",
				"templ",
			},
			experimental = {
				classRegex = {
					[[class="([^"]*)]],
					'class=\\s+"([^"]*)',
				},
			},
			init_options = {
				userLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
					rust = "html",
					templ = "html",
				},
			},
			root_dir = require("lspconfig").util.root_pattern(
				"tailwind.config.js",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.ts",
				"package.json",
				"node_modules"
			),
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("jake-lsp-attach", { clear = true }),
			callback = function(event)
				local opts = { buffer = event.buf, remap = false }

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "K", "I", opts)
				vim.keymap.set("n", "<leader>H", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>rr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)

				vim.diagnostic.config({
					virtual_text = true,
				})
			end,
		})
		require("mason-lspconfig").setup({
			ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for ts_ls)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
