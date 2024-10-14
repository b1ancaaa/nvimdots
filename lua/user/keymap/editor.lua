local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_callback = bind.map_callback
local et = bind.escape_termcode
return {

	["n|<leader>sS"] = map_cu("SessionSelect"):with_noremap():with_silent():with_desc("session: Select"),

	vim.keymap.set("n", "<leader>qs", function()
		require("persistence").load()
	end),

	-- select a session to load
	vim.keymap.set("n", "<leader>qS", function()
		require("persistence").select()
	end),

	-- load the last session
	vim.keymap.set("n", "<leader>ql", function()
		require("persistence").load({ last = true })
	end),

	-- stop Persistence => session won't be saved on exit
	vim.keymap.set("n", "<leader>qd", function()
		require("persistence").stop()
	end),
}
