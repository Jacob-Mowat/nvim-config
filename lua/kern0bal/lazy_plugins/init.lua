return {
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "folke/trouble.nvim",
        config = function()
            -- TODO: Remove icons as I don't have the font pack
            require("trouble").setup({
                icons = false
            })
        end
    },
    "github/copilot.vim",
    "eandrju/cellular-automaton.nvim",
    "laytan/cloak.nvim"
}
