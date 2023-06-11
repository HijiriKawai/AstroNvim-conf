return {
  lsp = {
    config = {
      denols = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
        return opts
      end,
      tsserver = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json")
        return opts
      end,
      eslint = function(opts)
        opts.root_dir = require("lspconfig.util").root_pattern("package.json", ".eslintrc.json", ".eslintrc.js")
        return opts
      end,
    },
  },
  plugins = {
    {
      "jay-babu/mason-null-ls.nvim",
      opts = {
        handlers = {
          -- for prettier
          prettier = function()
            require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                    or utils.root_has_file ".prettierrc"
                    or utils.root_has_file ".prettierrc.json"
                    or utils.root_has_file ".prettierrc.js"
              end,
            })
          end,
          -- for prettierd
          prettierd = function()
            require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                    or utils.root_has_file ".prettierrc"
                    or utils.root_has_file ".prettierrc.json"
                    or utils.root_has_file ".prettierrc.js"
              end,
            })
          end,
          -- For eslint_d:
          eslint_d = function()
            require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
              condition = function(utils)
                return utils.root_has_file "package.json"
                    or utils.root_has_file ".eslintrc.json"
                    or utils.root_has_file ".eslintrc.js"
              end,
            })
          end,
        },
      },
    },
  },
}
