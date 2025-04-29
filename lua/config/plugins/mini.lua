return {
	{
		'echasnovski/mini.nvim',
		enabled = true,
		config = function()
			local statusline = require 'mini.statusline'
			statusline.setup { use_icons = true }
			local starter = require 'mini.starter'
			starter.setup {}

			-- require('mini.files').setup({
			-- 	windows = {
			-- 		-- Place it on the left like a traditional side explorer
			-- 		position = 'false',
			-- 		width = 30,
			-- 		preview = true, -- optional: shows preview for selected files
			--
			-- 	},
			-- })
			-- vim.keymap.set('n', '<leader>e', function()
			-- 	require('mini.files').open()
			-- end, { desc = 'Open file explorer (mini.files)' })
			--
			local pairs = require 'mini.pairs'
			pairs.setup {}

			-- require('mini.tabline').setup({
			-- 	show_icons = false,    -- Disable devicons
			-- 	set_vim_settings = true, -- Set showtabline, etc.
			--
			-- 	tabpage_section = 'right', -- Or 'left', where tabpages are shown
			-- 	tabpage_format = 'Tab %d', -- Format string for tabpages
			--
			-- 	-- Customize how buffers are displayed
			-- 	buffer_label = function(buf_id, label)
			-- 		return label
			-- 	end,
			-- })
		end
	},
}
