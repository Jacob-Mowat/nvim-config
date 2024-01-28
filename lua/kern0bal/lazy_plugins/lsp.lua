return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },

    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyser",
                "tsserver",
                "clangd",
                "bashls",
                "dockerls",
                "eslint",
                --"emmet_ls",
                "graphql",
                "html",
                --"htmx",
                --"hls",
                "jsonls",
                "marksman",
                --"ocamllsp",
                "prismals",
                "pylsp",
                "sqlls",
                "tailwindcss",
                --"zls",
            },

            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end
            }
        })
    end
}
