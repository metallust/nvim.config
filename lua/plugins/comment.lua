return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    lazy = false,
    config = function()
         require("Comment").setup({
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
        })
    end
}
