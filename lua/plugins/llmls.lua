return {
	"huggingface/llm.nvim",
	opts = {
		backend = "ollama",
		url = "http://localhost:11434/api/generate",
		model = "qwen2.5-coder:7b-base", -- change to 7b-base on your M2 Max
		debounce_ms = 150,
		accept_keymap = "<C-Space>",
		dismiss_keymap = "<S-Space>",
		tls_skip_verify_insecure = false,
		lsp = {
			bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/lsp_servers/llm-ls/llm-ls",
		},
		tokenizer = nil, -- Automatically fetched or handled by llm-ls
		request_body = {
			options = {
				num_predict = 30, -- Keep this low (30-60 tokens max for ghost text)
				temperature = 0, -- Lower means faster and more accurate code
			},
		},
		context_window = 4096,
		fim = {
			enabled = true,
			prefix = "<|fim_prefix|>",
			middle = "<|fim_middle|>",
			suffix = "<|fim_suffix|>",
		},
	},
}
