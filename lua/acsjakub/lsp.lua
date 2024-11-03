local lspconfig = require("lspconfig")

function lsp_keymap(info)
	print("[lsp]: mapping keys for LSP in " .. info.file)
	local opts = { noremap = true, silent = true }
	keymaps = {
		["gD"] = "<cmd>lua vim.lsp.buf.declaration()<CR>",
		["gd"] = "<cmd>lua vim.lsp.buf.definition()<CR>",
		["gr"] = "<cmd>lua vim.lsp.buf.references()<CR>",
		["gi"] = "<cmd>lua vim.lsp.buf.implementation()<CR>",
		["li"] = "<cmd>lua vim.lsp.buf.incoming_calls()<CR>",
		["lo"] = "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>",
		["cn"] = "<cmd>lua vim.lsp.buf.rename()<CR>",
		["K"] = "<cmd>lua vim.lsp.buf.hover()<CR>",
	}

	for key, action in pairs(keymaps) do
		vim.api.nvim_buf_set_keymap(info.buf, "n", key, action, opts)
	end
	
end

lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = lsp_keymap
})

