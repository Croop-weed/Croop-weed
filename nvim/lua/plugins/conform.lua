return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				java = { "google-java-format" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				lua = { "stylua" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})

		-- Manual format trigger
		vim.keymap.set("n", "<leader>gf", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format file" })

		-- F5 shortcut to compile & run current file in floating terminal
		vim.keymap.set("n", "<F5>", function()
			local Terminal = require("toggleterm.terminal").Terminal
			local file = vim.fn.expand("%")
			local output = vim.fn.expand("%:r")
			local ft = vim.bo.filetype
			local cmd = ""

			if ft == "java" then
				cmd = "javac " .. file .. " && java " .. output
			elseif ft == "c" then
				cmd = "gcc " .. file .. " -o " .. output .. " -lm && ./" .. output
			elseif ft == "cpp" then
				cmd = "g++ " .. file .. " -o " .. output .. " && ./" .. output
			end

			if cmd ~= "" then
				Terminal:new({
					cmd = cmd,
					close_on_exit = false,
					direction = "float",
				}):toggle()
			end
		end, { noremap = true, silent = true, desc = "Compile & Run with F5" })
	end,
}
