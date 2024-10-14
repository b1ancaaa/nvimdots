local custom = {}

custom["kawre/leetcode.nvim"] = {
	cmd = "Leet",
	build = ":TSUpdate html",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- telescope 所需
		"MunifTanjim/nui.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- 配置放在这里
		plugins = {
			non_standalone = true,
		},
		cn = {
			enabled = true,
		},
	},
}

return custom
