return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"vim",
				"yaml",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {})
		end,
	},
}
