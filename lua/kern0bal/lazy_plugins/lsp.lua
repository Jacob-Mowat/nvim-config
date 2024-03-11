return {
    "williamboman/mason-lspconfig.nvim",

    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim"
    },

    config = function()
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                --"rust_analyzer",
                "tsserver",
                "clangd",
                --"bashls",
                --"dockerls",
                "eslint",
                --"emmet_ls",
                --"graphql",
                "html",
                --"htmx",
                --"hls",
                "jsonls",
                "marksman",
                --"ocamllsp",
                "prismals",
                "pylsp",
                --"sqlls",
                "tailwindcss",
                --"zls",
            },

            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                ["pylsp"] = function()
                    local lspconfig = require("lspconfig")

                    lspconfig.pylsp.setup({
                        settings = {
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        maxLineLength = 120
                                    }
                                }
                            }
                        }
                    })
                end,

                ["lua_ls"] = function()
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

                ["tsserver"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.tsserver.setup({
                        filetypes = {
                            "typescript",
                            "typescriptreact",
                            "typescript.tsx"
                        },
                        cmd = { "typescript-language-server", "--stdio" }
                    })
                end,
            }
        })

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    --vim.fn["vsnip#anonymous"](args.body)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            })
        })

        vim.diagnostic.config({
            virtual_text = true
        })
    end
}
