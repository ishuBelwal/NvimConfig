require("config.lazy")

vim.opt.clipboard = "unnamedplus"
require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Use a symbol instead of just text (optional)
		spacing = 4, -- Adjust spacing from the code
	},
	signs = true, -- Show signs in the left column
	underline = false, -- Underline the error
	update_in_insert = true, -- Don't update in insert mode
	severity_sort = true, -- Show severe issues first
})
