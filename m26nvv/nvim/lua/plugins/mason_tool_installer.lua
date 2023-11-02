local M = {}
M.ensure_installed = {}
M.ensure_installed = vim.tbl_deep_extend("force", M.ensure_installed, require("plugins.efm").ensure_installed)
M.ensure_installed = vim.tbl_deep_extend("force", M.ensure_installed, require("plugins.lspconfig").ensure_installed)
M.do_ensure_installed = function()
	require("mason-tool-installer").check_install(true)
end

local config = function()
	require("mason-tool-installer").setup({

		-- a list of all tools you want to ensure are installed upon
		-- start; they should be the names Mason uses for each tool
		ensure_installed = M.ensure_installed,
		-- if set to true this will check each tool for updates. If updates
		-- are available the tool will be updated. This setting does not
		-- affect :MasonToolsUpdate or :MasonToolsInstall.
		-- Default: false
		auto_update = false,

		-- automatically install / update on startup. If set to false nothing
		-- will happen on startup. You can use :MasonToolsInstall or
		-- :MasonToolsUpdate to install tools and check for updates.
		-- Default: true
		run_on_start = true,

		-- set a delay (in ms) before the installation starts. This is only
		-- effective if run_on_start is set to true.
		-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
		-- Default: 0
		start_delay = 3000, -- 3 second delay

		-- Only attempt to install if 'debounce_hours' number of hours has
		-- elapsed since the last time Neovim was started. This stores a
		-- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
		-- This is only relevant when you are using 'run_on_start'. It has no
		-- effect when running manually via ':MasonToolsInstall' etc....
		-- Default: nil
		debounce_hours = 5, -- at least 5 hours between attempts to install/update
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "MasonToolsStartingInstall",
		callback = function()
			vim.schedule(function()
				print("mason-tool-installer is starting")
			end)
		end,
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "MasonToolsUpdateCompleted",
		callback = function(e)
			vim.schedule(function()
				print(vim.tbl_isempty(e.data) and "" or vim.inspect(e.data)) -- print the table that lists the programs that were installed
			end)
		end,
	})
end

M = vim.tbl_deep_extend("force", M, {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	event = "VeryLazy",
	config = config,
})

return M
