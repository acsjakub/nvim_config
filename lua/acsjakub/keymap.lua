local opts = { noremap = true, silent = true }

-- don't forget to work on the strong basics:
-- https://devhints.io/vim
-- https://vim.rtorr.com/

-- set SPACE as global modifier prefix
-- It is referenced in mappings as <Leader>
vim.g.mapleader = " "

--- Map keybindings for window commands
-- for <key> : action
-- set the following keybinding:
-- LEADER-w-<key> -> action
function set_window_commands()
	local window_mod = "<Leader>w"
	keymaps = {
		["v"] = ":vsplit<CR>",
		["b"] = ":split<CR>",
		["d"] = "<C-w>q",
		["h"] = "<C-w>h",
		["j"] = "<C-w>j",
		["k"] = "<C-w>k",
		["l"] = "<C-w>l",
	}
	for key, action in pairs(keymaps) do
		vim.api.nvim_set_keymap("n", window_mod .. key, action, opts)
	end
end

set_window_commands()

-- this is how to set it the basic way
vim.api.nvim_set_keymap("n", "<Leader>e", ":Lex 20<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>p", "<C-o>", opts)
vim.api.nvim_set_keymap("n", "<Leader>n", "<C-i>", opts)

-- ripgrep (wait for input silently)
vim.api.nvim_set_keymap("n", "<Leader>rg", ":AcsjakubRG ", opts) -- populates quickfix list
vim.api.nvim_set_keymap("n", "<Leader>rrg", ":term rg ", opts) -- as in "raw rg"

vim.api.nvim_set_keymap("t", "<esc><esc>", "<c-\\><c-n>", opts)
vim.api.nvim_set_keymap("n", "<Leader>t", ":AcsjakubTerminal<CR>", opts)
