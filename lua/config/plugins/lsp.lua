local format_on_save_filetypes = {
	lua = true,
	go = true,
	cpp = true,
	c = true,
	java = true,
	python = true
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{
				"hrsh7th/cmp-nvim-lsp",
			},
		},
		config = function()
			require("lspconfig").lua_ls.setup {}
			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local c = vim.lsp.get_client_by_id(args.data.client_id)
					if not c then return end

					local buf = args.buf
					local ft = vim.bo[buf].filetype

					if format_on_save_filetypes[ft] then
						-- Format the current buffer on save
						vim.api.nvim_create_autocmd('BufWritePre', {
							buffer = args.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
							end,
						})
					end
				end,
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig").clangd.setup {
				capabilities = capabilities,
			}

			require("lspconfig").gopls.setup {}
		end,
	}
}
