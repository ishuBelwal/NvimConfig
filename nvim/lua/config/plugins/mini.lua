return {
	{
		'echasnovski/mini.nvim',
		enabled = true,
		config = function()
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }
			local starter = require 'mini.starter'
			starter.setup {}

			require('mini.files').setup({
				windows = {
					-- Place it on the left like a traditional side explorer
					position = 'false',
					width = 30,
					preview = true, -- optional: shows preview for selected files

				},
			})
			vim.keymap.set('n', '<leader>e', function()
				require('mini.files').open()
			end, { desc = 'Open file explorer (mini.files)' })

			local pairs = require 'mini.pairs'
			pairs.setup {}

		end
	},
}
