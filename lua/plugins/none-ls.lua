return {
    "nvimtools/none-ls.nvim", -- configure formatters & linters
    lazy = true,
    -- event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local mason_null_ls = require("mason-null-ls")

        local null_ls = require("null-ls")

        local null_ls_utils = require("null-ls.utils")

        mason_null_ls.setup({
            ensure_installed = {
                "prettierd", -- prettier formatter
                "stylua",    -- lua formatter
                "black",     -- python formatter
                "pylint",    -- python linter
            },
        })

        -- for conciseness
        local formatting = null_ls.builtins.formatting   -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- configure null_ls
        null_ls.setup({
            -- setup formatters & linters
            sources = {
                formatting.prettierd,
                formatting.stylua, -- lua formatter
                formatting.isort,
                formatting.black,
                diagnostics.pylint,
            },
            -- configure format on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                else
                    print("formatting...")
                end
            end,
        })
    end,
}
