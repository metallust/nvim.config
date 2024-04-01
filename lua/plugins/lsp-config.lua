return {
    "neovim/nvim-lspconfig",
    --event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        --    { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        --changing the sign
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local servers = {"tsserver", "lua_ls", "gopls", "html", "cssls", "tailwindcss", "pyright", "eslint"}
        for _, lsp in pairs(servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
            })
        end

        -- configure prisma orm server
        --lspconfig["prismals"].setup({
        --    capabilities = capabilities,
        --    on_attach = on_attach,
        --})

        lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
