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

	vim.api.nvim_buf_set_keymap(
		info.buf,
		"n",
		"<Leader>gs",
		":AcsjakubLSPSearchWorkspace ",
		opts
	)

	vim.api.nvim_buf_set_keymap(
		info.buf,
		"i",
		"<Tab>",
		"<C-X><C-O>", -- this triggers omnifunc completion in VIM - I should maybe learn more about that
		opts
	)

end

lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})
lspconfig.pylsp.setup({})

vim.api.nvim_create_user_command(
	"AcsjakubLSPSearchWorkspace",
	function(arg)
		vim.lsp.buf.workspace_symbol(arg.args)
	end ,
	{ nargs=1 }
)

vim.api.nvim_create_autocmd('LspAttach', {
	callback = lsp_keymap
})

