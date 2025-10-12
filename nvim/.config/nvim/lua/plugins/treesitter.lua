return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false, -- or set appropriate events
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
