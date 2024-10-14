local tool = {}

tool["CopilotC-Nvim/CopilotChat.nvim"] = {
	cmd = "CopilotChat",
	branch = "canary",
	build = "make tiktoken", -- Only on MacOS or Linux
	opts = {
		debug = true, -- Enable debugging
		-- See Configuration section for rest
	},
	config = require("configs.tools.CopilotChat"),
	-- See Commands section for default commands if you want to lazy load on them
}

tool["CRAG666/code_runner.nvim"] = {
	cmd = "RunCode",
	dependencies = { "akinsho/toggleterm.nvim" },
	opts = {
		mode = "toggleterm",
	},
	config = true,
}

tool["Civitasv/cmake-tools.nvim"] = {
	lazy = true,
	event = "BufReadPost",
	opts = {},
	config = {
		cmake_build_directory = "build",
		cmake_kits_path = "~/.config/nvim/lua/user/configs/tools/cmake-kits.json",
	},
	dependencies = { "stevearc/overseer.nvim", opts = {} },
	init = function()
		local loaded = false
		local function check()
			local cwd = vim.uv.cwd()
			if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
				require("lazy").load({ plugins = { "cmake-tools.nvim" } })
				loaded = true
			end
		end
		check()
		vim.api.nvim_create_autocmd("DirChanged", {
			callback = function()
				if not loaded then
					check()
				end
			end,
		})
	end,
}

return tool
