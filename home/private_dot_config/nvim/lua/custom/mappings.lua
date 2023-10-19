local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger",
    },
  },
}

M.general = {
  i = {
    ["jk"] = { "<ESC>", "To normal mode" },
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  },

  n = {
    ["<leader>a"] = {
      "<cmd>lua require('harpoon.mark').add_file()<CR>",
      "Add harpoon mark",
    },
    ["<C-k>"] = {
      "<cmd>lua require('harpoon.ui').nav_next()<CR>",
      "Next harpoon mark",
    },
    ["<C-l>"] = {
      "<cmd>lua require('harpoon.ui').nav_prev()<CR>",
      "Prev harpoon mark",
    },
    ["<leader>ml"] = {
      "<cmd>Telescope harpoon marks<CR>",
      "List harpoon marks",
    },
    ["<leader>fl"] = {
      "<cmd>CellularAutomaton make_it_rain<CR>",
      "Run make it rain from cellularautomaton",
    },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["gr"] = { "<cmd>Telescope lsp_references<cr>", "LSP references" },
    ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "LSP definations" },
  },
}

M.automation = {
  plugin = true,
  n = {},
}

return M
