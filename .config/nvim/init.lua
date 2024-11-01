local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"mbbill/undotree",
	"neovim/nvim-lspconfig",
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
	{"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
},
{
	'akinsho/flutter-tools.nvim',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = true,
},
})

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "jsonc", "json", "css", "python" },
	auto_install = true,
	highlight = {
		enable = true,
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,
		additional_vim_regex_highlighting = false,
	},
}
require'lspconfig'.qmlls.setup{
        cmd = {"qmlls6"},
}
require("mason").setup()
require("mason-lspconfig").setup_handlers {
	function (server_name)
		require("lspconfig")[server_name].setup {}
	end,
	["lua_ls"] = function ()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" }
					}
				}
			}
		}
	end,
}

require("flutter-tools").setup {}

local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = 'buffer' },
	})
})

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.g.mapleader = " "
vim.keymap.set('n','<leader>f',"<cmd>Ex<cr>")
vim.keymap.set('n','<leader>qf',"<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set('n','<leader>y','"+y')
vim.keymap.set('v','<leader>y','"+y')
vim.keymap.set('n','<leader>p','"+p')
vim.keymap.set('n','<leader>u', vim.cmd.UndotreeToggle)

vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.cmd.colorscheme('gruvbox')
