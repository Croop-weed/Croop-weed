return {

	-- Mason (LSP/DAP/tool installer)
	{
		"williamboman/mason.nvim", -- ⚠️ not "mason-org/mason.nvim"
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-LSPConfig bridge
	{
		"williamboman/mason-lspconfig.nvim", -- ⚠️ not "mason-org/mason-lspconfig.nvim"
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"jdtls", -- Java
					"html", -- HTML
					"cssls", -- CSS
					"tsserver", -- JavaScript / TypeScript
				},
				automatic_installation = true,
			})
		end,
	},

	-- Actual LSP configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Lua
			lspconfig.lua_ls.setup({ capabilities = capabilities })

			-- Rust
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })

			-- Java
			lspconfig.jdtls.setup({ capabilities = capabilities })
			-- HTML
			lspconfig.html.setup({ capabilities = capabilities })

			-- CSS
			lspconfig.cssls.setup({ capabilities = capabilities })

			-- JavaScript/TypeScript
			lspconfig.ts_ls.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.diagnostic.config({
				virtual_text = true, -- shows inline error messages
				signs = true, -- show signs in gutter
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"google-java-format",
					"clang-format",
					"stylua",
				},
				auto_update = false,
				run_on_start = true,
				start_delay = 3000, -- ms delay before installation starts
			})
		end,
	},
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local jdtls = require("jdtls")
			local home = os.getenv("HOME")

			local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

			local config = {
				cmd = {
					"jdtls",
					"--jvm-arg=--enable-native-access=ALL-UNNAMED", -- important for Java 17+
				},
				root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
				workspace_folder = workspace_dir,
			}

			jdtls.start_or_attach(config)
		end,
	},
}
