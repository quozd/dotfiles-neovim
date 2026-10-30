vim.lsp.enable({
	"lua_ls",
	"gopls",
	"pyright",
	"rust_analyzer",
	"tsc",
})

vim.lsp.config.rust_analyzer = {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy",
                extraArgs = { "--no-deps" }
            },
            diagnostics = {
                enable = true;
            },
            inlayHints = {
                bindingModeHints = {
                    enable = true;
                },
                chainingHints = {
                    enable = true;
                },
                closingBraceHints = {
                    enable = true;
                },
                closureCaptureHints = {
                    enable = true;
                },
                closureReturnTypeHints = {
                    enable = "always";
                },
                lifetimeElisionHints = {
                    enable = "skip_trivial",
                    useParameterNames = true
                },
            },
        },
    },
}

vim.lsp.config("tsc", {
	cmd = { "tsc", "--lsp", "--stdio" },
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
	settings = {
		typescript = {
			inlayHints = {
				parameterNames = {
					enabled = "literals",
					suppressWhenArgumentMatchesName = true,
				},
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
			preferences = {
				importModuleSpecifier = "non-relative",
			},
		},
	},
	root_dir = function(bufnr, on_dir)
		-- The project root is where the LSP can be started from
		-- As stated in the documentation above, this LSP supports monorepos and simple projects.
		-- We select then from the project root, which is identified by the presence of a package
		-- manager lock file.
		local root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", "bun.lock" }
		-- Give the root markers equal priority by wrapping them in a table
		root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
			or vim.list_extend(root_markers, { ".git" })

		local deno_root = vim.fs.root(bufnr, { "deno.json", "deno.jsonc" })
		local deno_lock_root = vim.fs.root(bufnr, { "deno.lock" })
		local project_root = vim.fs.root(bufnr, root_markers)
		if deno_lock_root and (not project_root or #deno_lock_root > #project_root) then
			-- deno lock is closer than package manager lock, abort
			return
		end
		if deno_root and (not project_root or #deno_root >= #project_root) then
			-- deno config is closer than or equal to package manager lock, abort
			return
		end
		-- project is standard TS, not deno
		-- We fallback to the current working directory if no project root is found
		on_dir(project_root or vim.fn.getcwd())
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client:supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end

		vim.keymap.set("n", "gK", function()
			local new_config = not vim.diagnostic.config().virtual_lines
			vim.diagnostic.config({ virtual_lines = new_config })
		end, { desc = "Toggle diagnostic virtual_lines" })
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		source = "if_many",
		current_line = true,
		spacing = 2,
	},
})
