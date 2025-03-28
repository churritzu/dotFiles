-- return {
-- 	"Kurama622/llm.nvim",
-- 	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
-- 	cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
-- 	config = function()
-- 		local tools = require("llm.common.tools")
-- 		require("llm").setup({
-- 			app_handler = {
-- 				OptimizeCode = {
-- 					handler = tools.side_by_side_handler,
-- 					-- opts = {
-- 					--   streaming_handler = local_llm_streaming_handler,
-- 					-- },
-- 				},
-- 				TestCode = {
-- 					handler = tools.side_by_side_handler,
-- 					prompt = [[ Write some test cases for the following code, only return the test cases.
--             Give the code content directly, do not use code blocks or other tags to wrap it. ]],
-- 					opts = {
-- 						right = {
-- 							title = " Test Cases ",
-- 						},
-- 					},
-- 				},
-- 				OptimCompare = {
-- 					handler = tools.action_handler,
-- 					opts = {
-- 						fetch_key = function()
-- 							return switch("enable_gpt")
-- 						end,
-- 						url = "https://models.inference.ai.azure.com/chat/completions",
-- 						model = "gpt-4o",
-- 						api_type = "openai",
-- 					},
-- 				},
--
-- 				Translate = {
-- 					handler = tools.qa_handler,
-- 					opts = {
-- 						fetch_key = function()
-- 							return switch("enable_glm")
-- 						end,
-- 						url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
-- 						model = "glm-4-flash",
-- 						api_type = "zhipu",
--
-- 						component_width = "60%",
-- 						component_height = "50%",
-- 						query = {
-- 							title = " 󰊿 Trans ",
-- 							hl = { link = "Define" },
-- 						},
-- 						input_box_opts = {
-- 							size = "15%",
-- 							win_options = {
-- 								winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
-- 							},
-- 						},
-- 						preview_box_opts = {
-- 							size = "85%",
-- 							win_options = {
-- 								winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
-- 							},
-- 						},
-- 					},
-- 				},
--
-- 				-- check siliconflow's balance
-- 				UserInfo = {
-- 					handler = function()
-- 						local key = os.getenv("LLM_KEY")
-- 						local res = tools.curl_request_handler(
-- 							"https://api.siliconflow.cn/v1/user/info",
-- 							{ "GET", "-H", string.format("'Authorization: Bearer %s'", key) }
-- 						)
-- 						if res ~= nil then
-- 							print("balance: " .. res.data.balance)
-- 						end
-- 					end,
-- 				},
--
-- 				WordTranslate = {
-- 					handler = tools.flexi_handler,
-- 					prompt = "Translate the following text to Chinese, please only return the translation",
-- 					opts = {
-- 						fetch_key = function()
-- 							return switch("enable_glm")
-- 						end,
-- 						url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
-- 						model = "glm-4-flash",
-- 						api_type = "zhipu",
-- 						args = [[return {url, "-N", "-X", "POST", "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],
-- 						exit_on_move = true,
-- 						enter_flexible_window = false,
-- 					},
-- 				},
--
-- 				CodeExplain = {
-- 					handler = tools.flexi_handler,
-- 					prompt = "Explain the following code, please only return the explanation, and answer in Chinese",
-- 					opts = {
-- 						fetch_key = function()
-- 							return switch("enable_glm")
-- 						end,
-- 						url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
-- 						model = "glm-4-flash",
-- 						api_type = "zhipu",
-- 						enter_flexible_window = true,
-- 					},
-- 				},
--
-- 				CommitMsg = {
-- 					handler = tools.flexi_handler,
-- 					prompt = function()
-- 						return string.format(
-- 							[[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:
-- 1. Start with an action verb (e.g., feat, fix, refactor, chore, etc.), followed by a colon.
-- 2. Briefly mention the file or module name that was changed.
-- 3. Describe the specific changes made.
--
-- Examples:
-- - feat: update common/util.py, added test cases for util.py
-- - fix: resolve bug in user/auth.py related to login validation
-- - refactor: optimize database queries in models/query.py
--
-- Based on this format, generate appropriate commit messages. Respond with message only. DO NOT format the message in Markdown code blocks, DO NOT use backticks:
--
-- ```diff
-- %s
-- ```
-- ]],
-- 							vim.fn.system("git diff --no-ext-diff --staged")
-- 						)
-- 					end,
-- 					opts = {
-- 						fetch_key = function()
-- 							return switch("enable_glm")
-- 						end,
-- 						url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
-- 						model = "glm-4-flash",
-- 						api_type = "zhipu",
-- 						enter_flexible_window = true,
-- 						apply_visual_selection = false,
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- 	keys = {
-- 		{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
-- 		{ "<leader>ts", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>" },
-- 		{ "<leader>ae", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>" },
-- 		{ "<leader>at", mode = "n", "<cmd>LLMAppHandler Translate<cr>" },
-- 		{ "<leader>tc", mode = "x", "<cmd>LLMAppHandler TestCode<cr>" },
-- 		{ "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>" },
-- 		{ "<leader>au", mode = "n", "<cmd>LLMAppHandler UserInfo<cr>" },
-- 		{ "<leader>ag", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>" },
-- 		-- { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>" },
-- 	},
-- }
return {
	{
		"Kurama622/llm.nvim",
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
		config = function()
			require("llm").setup({
				-- [[ Deepseek ]]
				api_key = "ollama",
				model = "deepseek-coder:1.3b",
				url = "http://localhost:11434/api/generate",
				api_base = "http://localhost:11434/api/generate",
				-- url = "https://api.deepseek.com/chat/completions",
				-- model = "deepseek-chat",
				-- api_type = "openai",
				max_tokens = 4096,
				temperature = 0.3,
				top_p = 0.7,

				prompt = "You are a helpful chinese assistant.",

				prefix = {
					user = { text = "😃 ", hl = "Title" },
					assistant = { text = "  ", hl = "Added" },
				},

				-- history_path = "/tmp/llm-history",
				save_session = true,
				max_history = 15,
				max_history_name_length = 20,

        -- stylua: ignore
        keys = {
          -- The keyboard mapping for the input window.
          ["Input:Submit"]      = { mode = "n", key = "<cr>" },
          ["Input:Cancel"]      = { mode = {"n", "i"}, key = "<C-c>" },
          ["Input:Resend"]      = { mode = {"n", "i"}, key = "<C-r>" },

          -- only works when "save_session = true"
          ["Input:HistoryNext"] = { mode = {"n", "i"}, key = "<C-j>" },
          ["Input:HistoryPrev"] = { mode = {"n", "i"}, key = "<C-k>" },

          -- The keyboard mapping for the output window in "split" style.
          ["Output:Ask"]        = { mode = "n", key = "i" },
          ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
          ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

          -- The keyboard mapping for the output and input windows in "float" style.
          ["Session:Toggle"]    = { mode = "n", key = "<leader>ac" },
          ["Session:Close"]     = { mode = "n", key = {"<esc>", "Q"} },
        },
			})
		end,
		keys = {
			{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
			{ "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
			{ "<leader>ts", mode = "x", "<cmd>LLMSelectedTextHandler 英译汉<cr>" },
		},
	},
}
