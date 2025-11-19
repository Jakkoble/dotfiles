return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      -- name must be in lspconfig list: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
      ensure_installed = { "lua_ls", "html", "cssls", "ts_ls", "jsonls", "rust_analyzer", "rubocop" },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {}
      },
      "neovim/nvim-lspconfig"
    },
    config = {
      -- disable vim globals warning
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          }
        }
      }),

      -- liquid configuration
      vim.lsp.config('html', { filetypes = { "html", "liquid", "html.erb" } }),

      -- setup format on save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          if not client then return end

          if client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
              end,
            })
          end
        end,
      }),

      -- setup keybinds
      vim.keymap.set("n", "<leader>dd", function()
        vim.diagnostic.open_float(nil, { focus = true })
      end, { desc = "Line diagnostics" })
    }
  }
}
