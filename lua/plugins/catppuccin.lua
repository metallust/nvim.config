return {
  "catppuccin/nvim",
  lazy=false,
  name="catppuccin",
  priority=1000,
  config= function()
        require("catppuccin").setup({
            --flavour = "latte",
--            flavour = "frappe",
            --flavour = "macchiato"
            transparent_background = true,
        })
        vim.cmd.colorscheme "catppuccin"
  end
}

