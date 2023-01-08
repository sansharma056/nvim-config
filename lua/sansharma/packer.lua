local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  vim.cmd([[packadd packer.nvim]])
end

return require("packer").startup(function(use)
  -- Packer
  use("wbthomason/packer.nvim")

  -- File traversal
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = { "nvim-lua/plenary.nvim" } })
  use({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
  use("ThePrimeagen/harpoon")

  -- UI
  use({
    "Mofiqul/dracula.nvim",
    as = "dracula",
    config = function()
      vim.cmd("colorscheme dracula")
    end,
  })
  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  use("lukas-reineke/indent-blankline.nvim")

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  })

  -- Git
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })

end)
