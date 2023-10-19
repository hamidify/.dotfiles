local has_formatter = pcall(require, "formatter")

if not has_formatter then
  return
end

local function prettier()
  return {
    exe = "prettier",
    args = {
      "--config-precedence",
      "prefer-file",
      "--single-quote",
      "--no-bracket-spacing",
      "--prose-wrap",
      "always",
      "--arrow-parens",
      "always",
      "--trailing-comma",
      "all",
      "--no-semi",
      "--end-of-line",
      "lf",
      "--print-width",
      vim.bo.textwidth,
      "--stdin-filepath",
      vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
    },
    stdin = true,
  }
end

local M = {
  filetype = {
    javascript = {
      prettier,
    },
    typescript = {
      prettier,
    },
    javascriptreact = {
      prettier,
    },
    typescriptreact = {
      prettier,
    },
    vue = {
      prettier,
    },
    ["javascript.jsx"] = {
      prettier,
    },
    ["typescript.tsx"] = {
      prettier,
    },
    markdown = {
      prettier,
    },
    css = {
      prettier,
    },
    json = {
      prettier,
    },
    jsonc = {
      prettier,
    },
    scss = {
      prettier,
    },
    less = {
      prettier,
    },
    yaml = {
      prettier,
    },
    graphql = {
      prettier,
    },
    html = {
      prettier,
    },
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--indent-type",
            "Spaces",
            "--line-endings",
            "Unix",
            "--quote-style",
            "AutoPreferDouble",
            "--call-parentheses",
            "None",
            "--indent-width",
            vim.bo.tabstop,
            "--column-width",
            vim.bo.textwidth,
            "-",
          },
          stdin = true,
        }
      end,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
  },
}

vim.api.nvim_create_autocmd({
  "BufWritePost",
}, {
  command = "FormatWriteLock",
})

return M
