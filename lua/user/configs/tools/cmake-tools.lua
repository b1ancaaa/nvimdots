return function()
	local osys = require("cmake-tools.osys")
	require("cmake-tools").setup({
		cmake_build_directory = function()
			if osys.iswin32 then
				return "build\\${variant:buildType}"
			end
			return "build/${variant:buildType}"
		end, -- this is used to specify generate directory for cmake, allows macro expansion, can be a string or a function returning the string, relative to cwd.
		cmake_kits_path = "~/.config/nvim/lua/user/configs/tools/cmake-kits.json", -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
	})
end
