return function()
	require("CopilotChat").setup({
		mappings = {
			reset = {
				normal = "<C-p>",
				insert = "<C-p>",
			},
		},
	})
end
