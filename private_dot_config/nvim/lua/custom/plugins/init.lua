local overrides = require "custom.plugins.overrides"

return {

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- Override plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },
}
