-- ~/.config/nvim/colors/mellow.lua loads this file and runs .load()
-- 
-- Credits
-- When writing this I got inspiration looking at
-- https://github.com/neanias/everforest-nvim/
--
-- and took the colors from 
-- https://github.com/kristijanhusak/vim-hybrid-material
--
-- this presentation helped me understand how coloring in vim works
-- https://speakerdeck.com/cocopon/creating-your-lovely-color-scheme?slide=33
--

local M = {}

M.load = function()
	vim.cmd("hi clear")

	local background = "#212b31"
	local foreground = "#c5c8c6" --        , 'light' : "#000000" }
	local selection = "#455A64" -- , 'light' : "#bcbcbc" }
	local line = "#3d535c" --'light' : "#d0d0d0" }
	local comment = "#707880" -- 'light' : "#5f5f5f" }
	local red = "#cc6666" --       , 'light' : "#5f0000" }
	local orange = "#de935f" -- #cc9166       , 'light' : "#875f00" }
	local yellow = "#f0c674" --  #ccc066      , 'light' : "#5f5f00" }
	local green = "#b5bd68" -- #a2cc66       , 'light' : "#005f00" }
	local aqua = "#8abeb7" --  #66ccb3      , 'light' : "#005f5f" }
	local blue = "#81a2be" --  #6691cc      , 'light' : "#00005f" }
	local purple = "#b294bb" -- #8f66cc       , 'light' : "#5f005f" }
	local pink = "#cc66a2" -- added by me
	local darkgrey = "#1c1c1c" --        , 'light' : "#808080" }
	local green2 = "#5F875F" -- addbg, , 'light' : "#d7ffd7" }
	local green3 = "#d7ffaf" -- addfg       , 'light' : "#005f00" }
	local darkpurple = "#5F5F87" -- changebg , 'light' : "#d7d7ff" }
	local lightpurple = "#d7d7ff" -- changefg        , 'light' : "#5f005f" }
	local darkred = "#cc6666" -- delbg, 'light' : "#ffd7d7" 
	local darkblue = "#00005f" --        , 'light' : "#d7ffd7" }
	local darkcyan = "#005f5f" --        , 'light' : "#005f00" }
	local darkred2 = "#5f0000" -- darkred        , 'light' : "#d7d7ff" }
	local darkpurple2 = "#5f005f" -- darkpurple        , 'light' : "#5f005f" }


	highlightings = {
		Normal			= {fg=foreground,	bg=background},
		ColorColumn 	= {fg=None, 		bg=line},
		Conceal 		= {fg=orange, 		bg=None},
		Cursor			= {fg=background,	bg=foreground},
		CursorColumn	= {fg=None, 		bg=line},
		CursorLine 		= {fg=None, 		bg=line},
		Directory		= {fg=blue, 		bg=None},
		DiffAdd			= {fg=green3, 		bg=green2},
		DiffChange		= {fg=lightpurple, 	bg=darkpurple},
		DiffDelete		= {fg=background,	bg=darkred},
		DiffText		= {fg=background,	bg=blue},
		ErrorMsg		= {fg=background, 	bg=red},
		-- Folded?
		-- FoldColumn
		SignColumn 		= {fg=None, 		bg=None},
		LineNr			= {fg=selection,	bg=None},
		CursorLineNr	= {fg=yellow,		bg=None},
		MatchParen		= {fg=pink,			bg=line},
		ModeMsg			= {fg=green,		bg=None},
		MoreMsg			= {fg=green,		bg=None},
		NonText			= {fg=selection,	bg=None},
		Pmenu			= {fg=foreground,	bg=selection},
		PmenuSel		= {fg=selection,	bg=foreground},
		Question		= {fg=green,		bg=None},
		QuickFixLine	= {fg=aqua,			bg=None},
		Search			= {fg=background,	bg=blue},
		-- SnippetTabstop
		-- SpecialKey
		-- SpellBad
		-- SpellCap
		-- SpellLocal
		-- SpellRare
		StatusLine		= {fg=foreground,	bg=selection},
		StatusLineNC	= {fg=comment,		bg=selection},
		TabLine			= {fg=foreground,	bg=line},
		TabLineSel		= {fg=yellow,		bg=None, bold=true},
		Visual			= {fg=None,			bg=selection},
		WarningMsg		= {fg=red,			bg=None},
		-- Syntax Highlights
		Comment			= {fg=comment,		bg=None, italic=true},
		Constant		= {fg=purple,		bg=None},
		String			= {fg=green,		bg=None},
		-- Character
		-- Number
		-- Float
		-- Boolean
		Identifier		= {fg=red,			bg=None},
		Function		= {fg=yellow,		bg=None},
		Statement		= {fg=blue,			bg=None},
		-- Conditional
		-- Repeat
		-- Label
		Operator		= {fg=aqua,			bg=None},
		-- Keyword
		-- Exception
		PreProc			= {fg=aqua,			bg=None, bold=true},
		-- Include
		-- Define
		-- Macro
		-- PreCondit
		Type			= {fg=orange,		bg=None, bold=true},
		-- StorageClass
		Structure		= {fg=aqua,			bg=None},
		-- TypeDef
		Special			= {fg=red,			bg=None},
		-- SpecialChar
		-- Tag
		-- Delimiter
		-- SpecialComment
		-- Debug
		Underlined		= {fg=blue,			bg=None},
		Ignore			= {fg=None,			bg=None},
		Error			= {fg=red,			bg=None},
		Todo			= {fg=green2,		bg=None, bold=true},
		qfLineNr		= {fg=yellow,		bg=None},
		-- qfFileName
		-- qfError
	}

	for k,v in pairs(highlightings) do
		vim.api.nvim_set_hl(0, k, v)
	end

end

return M
