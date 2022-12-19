require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "go", "javascript", "typescript", "help" },
	highlight = {
		enable = true,
		indent = { enable = true },
		additional_vim_regex_highlighting = false,
	},
})
