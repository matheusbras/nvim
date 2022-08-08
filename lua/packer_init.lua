-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use "wbthomason/packer.nvim" -- packer can manage itself

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "moll/vim-bbye" -- Remove buffers without closing the window
  use "akinsho/toggleterm.nvim" -- Manage terminals inside nvim
  use "lewis6991/impatient.nvim" -- Improve loading speed of lua modules
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "github/copilot.vim"
  use "vim-test/vim-test"
  use "tpope/vim-rails"
  use "tpope/vim-endwise"
  use "tpope/vim-surround"
  use "tpope/vim-eunuch"
  use "tpope/vim-repeat"

  -- File explorer
  use "kyazdani42/nvim-tree.lua"

  -- Icons
  use "kyazdani42/nvim-web-devicons"

  -- Treesitter interface
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TsUpdate"
  }

  use "sheerun/vim-polyglot"

  -- Color schemes
  use 'navarasu/onedark.nvim'

  -- LSP
  use "neovim/nvim-lspconfig"

  -- Autocomplete
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
  }

  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "nvim-telescope/telescope.nvim" -- Search, file explorer and etc
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Statusline
  use {
    "feline-nvim/feline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- git labels
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
