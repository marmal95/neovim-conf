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

    ["<C-Right>"] = { ':vertical resize +2<CR>' },
    ["<C-Left>"] = { ':vertical resize -2<CR>' },
    ["<C-Up>"] = { ':horizontal resize +2<CR>' },
    ["<C-Down>"] = { ':horizontal resize -2<CR>' },

    ["<C-e>"] = { ':tabnext <CR>' },
    ["<C-q>"] = { ':tabprev <CR>' },

    ["trq"] = { ':tabmove -1<CR>' },
    ["tre"] = { ':tabmove +1<CR>' },

    ["gh"] = { ":let @/='\\<'.expand('<cword>').'\\>' <bar> set hls <CR>" },

    ["mm"] = { function()
      pcall(function()
        require('core.work').switch_header_source()
      end, { desc = "Switch C++ header/source file" })
    end }
  }
}

M.fzf = {
  n = {
    ["<leader>ff"] = { "<cmd> FzfLua files <CR>", { desc = "Find files" } },
    ["<leader>fr"] = { "<cmd> FzfLua resume <CR>", { desc = "Resume find/grep" } },
    ["<leader>fb"] = { "<cmd> FzfLua buffers <CR>", { desc = "Browse buffers" } },
    ["<leader>fg"] = { "<cmd> FzfLua live_grep_glob <CR>", { desc = "Grep files" } },
    ["<leader>fs"] = { "<cmd> FzfLua grep_cword <CR>", { desc = "Grep cursor word" } },
    ["<leader>fcg"] = { function()
      local default_rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096"
      local ignore_pattern = "'!test'"
      local rg_opts = default_rg_opts .. ' -g ' .. ignore_pattern .. ' -e '
      require('fzf-lua').live_grep({ rg_opts = rg_opts })
    end, { desc = "Grep files excluding tests" } },
  },
  v = {
    ["<leader>fg"] = { "<cmd> FzfLua grep_visual <CR>", { desc = "Grep selection" } },
  }
}

M.nvim_tree = {
  n = {
    ["<leader>tt"] = { ":NvimTreeToggle <CR>", { desc = "Toggle file explorer tree" } },
    ["<leader>tf"] = { ":NvimTreeFindFile<CR>", { desc = "Find current file in file explorer tree" } },
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
      { desc = "Jump to next hunk" },
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
      { desc = "Jump to prev hunk" },
    },

    ["<leader>hr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      { desc = "Reset hunk" },
    },

    ["<leader>hp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      { desc = "Preview hunk" },
    },

    ["<leader>hb"] = {
      function()
        package.loaded.gitsigns.blame_line { full = true }
      end,
      { desc = "Blame line" },
    },

    ["<leader>td"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      { desc = "Toggle deleted" },
    },
  },
}

M.hop = {
  n = {
    ["<leader>jw"] = { "<cmd> HopWord <CR>", { desc = "Jump to word" } },
    ["<leader>jp"] = { "<cmd> HopPattern <CR>", { desc = "Jump to pattern" } },
    ["<leader>jl"] = { "<cmd> HopLineStart <CR>", { desc = "Jump to line" } },
  }
}

M.lspconfig = {
  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      { desc = "LSP declaration" },
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      { desc = "LSP definition" },
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      { desc = "LSP hover" },
    },

    ["gi"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      { desc = "LSP implementation" },
    },

    ["gtd"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      { desc = "LSP definition type" },
    },

    ["gr"] = {
      function()
        vim.lsp.buf.references()
      end,
      { desc = "LSP references" },
    },

    ["<space>e"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      { desc = "Floating diagnostic" },
    },

    ["<space>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      { desc = "Code action" },
    },

    ["<space>cf"] = {
      function()
        vim.lsp.buf.format()
      end,
      { desc = "Code format" },
    },

    ["<space>h"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      { desc = "Code signature help" },
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      { desc = "Goto prev" },
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      { desc = "Goto next" },
    },

    ["<leader>q"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      { desc = "Diagnostic setloclist" },
    },

    ["<leader>wa"] = {
      function()
        vim.lsp.buf.add_workspace_folder()
      end,
      { desc = "Add workspace folder" },
    },

    ["<leader>wr"] = {
      function()
        vim.lsp.buf.remove_workspace_folder()
      end,
      { desc = "Remove workspace folder" },
    },

    ["<leader>wl"] = {
      function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end,
      { desc = "List workspace folders" },
    },
  },

  v = {
    ["<space>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      { desc = "LSP code action" },
    },
  },
}

return M
