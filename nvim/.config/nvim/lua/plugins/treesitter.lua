return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "julia" })
    end,
  },
}
