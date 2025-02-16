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

-- TODO: a better way would be to consume the rg output in json form
-- just use vim.json.decode?
local function rg_stdout_to_qflines(stdout)
	qflines = {}
	for line in stdout:gmatch("([^\n]*)\n?") do
		items = {}

		-- split line by `:`
		for item in line:gmatch("([^:]+)") do
			table.insert(items, item)
		end

		qfline = {
			filename=items[1],
			lnum=items[2],
			col=items[3],
			-- merge text in case it contained `:` and got split
			text=table.concat(items,"", 4),
		}
		table.insert(qflines, qfline)
	end

	return qflines

end

local function qf_modifier(info)
	items = vim.fn.getqflist({id=info.id, items=1}).items
	result = {}
	for _,item in ipairs(items) do
		table.insert(result, vim.fn.bufname(item.bufnr) .. ':' .. item.lnum .. ':' .. item.col .. ':' .. item.text)
	end
	return result
end

local function acsjakub_rg(args)
	-- expects exactly one argument
	search_term = args.args
	-- TODO can I do this asynchronously? - I cannot call copen and setqflist asyncly

	hnd = vim.system({'rg', search_term, '--vimgrep'}, {text=true}):wait()

	if hnd.code ~= 0 then
		print("No matches found (rg exited non-zero)")
		return nil
	end

	qflines = rg_stdout_to_qflines(hnd.stdout)
	print(vim.inspect(qflines))

	-- need to open qf window (setqflist does create new if it doesn't exist,
	-- but that doesn't mean that window get's opened
	vim.cmd.copen()

	qfoptions = {quickfixtextfunc=qf_modifier, items=qflines}
	vim.fn.setqflist({}, ' ', qfoptions)

end

vim.api.nvim_create_user_command("AcsjakubRG", acsjakub_rg, {nargs=1})

