-- project's root directory and documents indentation detector with project based config loader

local status_ok, penvim = pcall(require, "penvim")
if not status_ok then
	return
end

penvim.setup({
	rooter = {
		enable = false, -- enable/disable rooter
		patterns = { ".__nvim__.lua", ".git", "node_modules" },
	},
	indentor = {
		enable = true, -- enable/disable indentor
		indent_length = 2, -- tab indent width
		accuracy = 5, -- positive integer. higher the number, the more accurate result (but affects the startup time)
		disable_types = {
			"help",
			"dashboard",
			"dashpreview",
			"NvimTree",
			"vista",
			"sagahover",
			"terminal",
		},
	},
	project_env = {
		enable = true, -- enable/disable project_env
		config_name = ".__nvim__.lua", -- config file name
	},
})
