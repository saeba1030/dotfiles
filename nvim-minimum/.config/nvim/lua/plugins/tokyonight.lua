return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		terminal_colors = true,
	},
	init = function()
		vim.cmd[[colorscheme tokyonight]]
	end
}
