return {
	'navarasu/onedark.nvim',
	priority = 100,
	opts = {
		style = 'darker',
		transparent = false
	},
	init = function()
		-- vim.cmd('colorscheme ondark');
		require('onedark').load();
	end
}
