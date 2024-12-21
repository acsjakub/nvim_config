-- :source % to run contents of this file
-- <C-W><C-W> apparently toggles between windows - it helped me to jump into the floating window I couldn't close
-- or :fclose for closing floating windows
-- <C-\><C-n> to exit terminal mode
--
local state = {
	buf = -1,
	win = -1,
}

local function create_floating_window(opts)
	opts = opts or {}
	local width = opts.width or math.floor(vim.o.columns * 0.7)
	local height = opts. height or math.floor(vim.o.lines * 0.7)

	-- Calculate the position of the center of the floating window
	local col = math.floor((vim.o.columns - width)) / 2
	local row = math.floor((vim.o.lines - height)) / 2

	-- Create or re-use a buffer
	local buf = opts.buf or -1
	if not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local win_config = {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "single"
	}

	local win = vim.api.nvim_open_win(buf, true, win_config)

	return { buf = buf, win = win }

end

local function toggle_terminal_window(opts)
	if not vim.api.nvim_win_is_valid(state.win) then
		state = create_floating_window({ buf = state.buf })
		if vim.bo[state.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
	else
		vim.api.nvim_win_hide(state.win)
	end
end

vim.api.nvim_create_user_command("AcsjakubTerminal", toggle_terminal_window, {})


