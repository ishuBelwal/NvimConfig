require("config.lazy")

vim.opt.clipboard = "unnamedplus"
require("lazy").setup({ { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" } })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", ":<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", ":<cmd>cprev<CR>")

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

vim.api.nvim_create_autocmd('TermOpen', {
	group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})

vim.keymap.set("n", "<space>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 8)
end)

vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		if vim.fn.isdirectory(vim.fn.argv()[1]) == 1 then
			require('mini.files').open(vim.fn.argv()[1])
		end
	end
})

vim.keymap.set('n', '<leader><tab>', '<C-^>', { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete current buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })
