local plugins = {
  -- Navigation
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = function()
      return require('plugins.configs.which-key')
    end,
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "FzfLua",
    init = function()
      require('core.utils').load_mappings('fzf')
    end,
    opts = function()
      return require "plugins.configs.fzf"
    end,
    config = function(_, opts)
      require("fzf-lua").setup(opts)
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    cmd = { "NvimTreeOpen", "NvimTreeClose", "NvimTreeFindFile", "NvimTreeToggle" },
    opts = function()
      return require "plugins.configs.nvim-tree"
    end,
    init = function()
      require('core.utils').load_mappings('nvim_tree')
    end,
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = { 'BufRead', 'BufNewFile' },
    config = function() require("nvim-autopairs").setup {} end
  },

  {
    'phaazon/hop.nvim',
    cmd = { "HopWord", "HopPattern", "HopLineStart" },
    init = function()
      require('core.utils').load_mappings('hop')
    end,
    config = function() require('hop').setup {} end
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { 'BufRead', 'BufNewFile' },
    init = function()
      require('core.utils').load_mappings('gitsigns')
    end,
    opts = function()
      return require "plugins.configs.gitsigns"
    end,
    config = function(_, opts)
      require('gitsigns').setup(opts)
    end,
  },

  {
    'numToStr/Comment.nvim',
    -- Keys triggering plugin lazy loading. Actual mapping done by defaults in `setup {}`
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    config = function() require('Comment').setup {} end
  },

  {
    "sontungexpt/stcursorword",
    event = { 'BufRead', 'BufNewFile' },
    config = true,
  },

  -- Language Support
  {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.configs.mason"
    end,
    config = function(_, opts)
      require("mason").setup(opts)

      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufRead', 'BufNewFile' },
    config = function() require('plugins.configs.lsp').configure {} end
  },

  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter' },
    opts = function()
      return require "plugins.configs.cmp"
    end,
    config = function(_, opts)
      require('cmp').setup(opts)
    end,
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },

      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { 'BufRead', 'BufNewFile' },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      return require('plugins.configs.tree-sitter')
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- Utils
  { "nvim-lua/plenary.nvim" },
  {
    'powerman/vim-plugin-AnsiEsc',
    cmd = 'AnsiEsc'
  },

  {
    'marmal95/nvim-cursor-number',
    cmd = { 'ConvertCursorNumber' },
    config = function(_, opts)
      require('cursor_number').setup(opts)
    end,
    opts = {}
  },

  -- UI
  {
    'neanias/everforest-nvim',
    lazy = false,
    config = function()
      require("everforest").setup({
        background = "medium",
        italics = true,
        -- Hack: Set to unsupported value (-1)
        -- Prevents setting Transparency and colors change by theme on its own
        transparent_background_level = -1
      })
    end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = function()
      return require('plugins.configs.lualine')
    end,
    config = function(_, opts)
      require('lualine').setup(opts)
    end,
  },

  {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require 'alpha'.setup(require 'alpha.themes.startify'.config) end
  },
}

return plugins
