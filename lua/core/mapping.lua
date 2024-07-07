local M = {}

M.general = {
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv" },
    ["K"] = { ":m '<-2<CR>gv=gv" },
  },

  n = {
    ["J"] = { "mzJ`z" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },

    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },

    ["<ESC>"] = { ":noh<CR>" },
    ["<bar>"] = { ":vsplit<CR>" },
    ["_"] = { ":split<CR>" },
    ["<C-k>"] = { ':wincmd k<CR>' },
    ["<C-l>"] = { ':wincmd l<CR>' },
    ["<C-h>"] = { ':wincmd h<CR>' },
    ["<C-j>"] = { ':wincmd j<CR>' },

    ["<C-e>"] = { ':tabnext <CR>' },
    ["<C-q>"] = { ':tabprev <CR>' },

    ["trq"] = { ':tabmove -1<CR>' },
    ["tre"] = { ':tabmove +1<CR>' },

    ["gh"] = { ":let @/='\\<'.expand('<cword>').'\\>' <bar> set hls <CR>" },

    ["mm"] = { function()
      pcall(function()
        require('core.work').switch_header_source()
      end)
    end }
  }
}

M.fzf = {
  n = {
    ["<leader>f"] = { "<cmd> FzfLua files <CR>", "Find files" },
    ["<leader>r"] = { "<cmd> FzfLua resume <CR>", "Resume find/grep" },
    ["<leader>b"] = { "<cmd> FzfLua buffers <CR>", "Browse buffers" },
    ["<leader>g"] = { "<cmd> FzfLua live_grep_glob <CR>", "Grep files" },
    ["<leader>s"] = { "<cmd> FzfLua grep_cword <CR>", "Grep cursor word" },
  },
  v = {
    ["<leader>g"] = { "<cmd> FzfLua grep_visual <CR>", "Grep visual" },
  }
}

M.nvim_tree = {
  n = {
    ["<F1>"] = { ":NvimTreeToggle <CR>", "Find files" },
    ["<leader>n"] = { ":NvimTreeFindFile<CR>", "Find files" },
  }
}

M.gitsigns = {
  n = {
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },

    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },

    ["<leader>hb"] = {
      function()
        package.loaded.gitsigns.blame_line{full = true}
      end,
      "Blame line",
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  },
}

M.hop = {
  n = {
    ["<leader><leader>w"] = { "<cmd> HopWord <CR>" },
    ["<leader><leader>p"] = { "<cmd> HopPattern <CR>" },
    ["<leader><leader>l"] = { "<cmd> HopLineStart <CR>" },
  }
}

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP declaration",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "LSP implementation",
    },

    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "LSP signature help",
    },

    ["<leader>D"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "LSP definition type",
    },

    ["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      "LSP references",
    },

    ["<space>e"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      "Add workspace folder",
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      "List workspace folders",
    },

    ["<space>f"] = {
      function()
        vim.lsp.buf.format()
      end,
      "Format code",
    },
  },

  v = {
    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  },
}

return M
