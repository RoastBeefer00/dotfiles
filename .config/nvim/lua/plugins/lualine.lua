return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = { "filename", "branch" },
				lualine_c = {
					"fileformat",
					"another_item",
					{
						"harpoon2",
						indicators = { "h", "t", "s", "n" },
						active_indicators = { "H", "T", "S", "N" },
					},
				},
				lualine_x = {
					function()
						return require("lsp-progress").progress()
					end,
				},
				-- lualine_x = {},
				lualine_y = {},
				-- lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
