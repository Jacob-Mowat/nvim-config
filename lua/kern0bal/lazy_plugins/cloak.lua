return {
    "laytan/cloak.nvim",

    config = function()
        require("cloak").setup({
            enabled = true,
            cloak_character = "*",

            highlight_group = "Comment",
            patterns = {
                {
                    file_pattern = {
                        ".env*",
                        "wrangler.toml",
                        ".dev.vars",
                        ".local.env",
                        ".dev.env",
                    },
                    cloak_pattern = "=.+"
                },
            },
        })
    end
}
