return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          'lua_ls',
          'pylsp',
          'html',
          'cssls',
          'marksman',
          'dockerls',
          'jsonls',
        }
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig.html.setup({capabilities = capabilities})
      lspconfig.lua_ls.setup({capabilities = capabilities})
      lspconfig.marksman.setup({capabilities = capabilities})
      lspconfig.dockerls.setup({capabilities = capabilities})
      lspconfig.pylsp.setup({capabilities = capabilities})
      lspconfig.cssls.setup({capabilities = capabilities})
      lspconfig.jsonls.setup({capabilities = capabilities})
    end
  }
}
