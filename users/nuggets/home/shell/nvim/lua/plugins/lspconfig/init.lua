return function()
  local lsp = require('lspconfig')

  local utils = require('utils')

  local capabilities = vim.lsp.protocol.make_client_capabilities()


  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) utils.buf_map(bufnr, ...) end

    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    buf_set_keymap('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    buf_set_keymap('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    buf_set_keymap('n', 'gk', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_set_keymap('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
    buf_set_keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')

    if client.server_capabilities.documentFormattingProvider then
      buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
      vim.cmd([[
      augroup lspAutoFormat
        autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end

    require('lsp_signature').on_attach({ hint_enable = false })
  end

  local make_on_attach = function(server_on_attach)
    return function(client, bufnr)
      on_attach(client, bufnr)

      if server_on_attach then
        server_on_attach(client, bufnr)
      end
    end
  end

  local servers = {
    require('plugins.lspconfig.rust-analyzer'),
    require('plugins.lspconfig.sumneko_lua'),
    require('plugins.lspconfig.texlab'),
    require('plugins.lspconfig.hls'),
    require('plugins.lspconfig.tsserver'),
    { name = 'rnix' },
    { name = 'bashls' },
    { name = 'pyright' },
    { name = 'purescriptls' },
  }

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      prefix = '🐸'
    },
  }
  )

  vim.lsp.handlers['textDocument/codeAction'] = require('lsputil.codeAction').code_action_handler

  vim.fn.sign_define('DiagnosticSignError', { text = '🥲', texthl = 'DiagnosticSignError' })
  vim.fn.sign_define('DiagnosticSignWarning', { text = '😠', texthl = 'DiagnosticSignWarning' })
  vim.fn.sign_define('DiagnosticSignInformation', { text = '🔎', texthl = 'DiagnosticSignInformation' })
  vim.fn.sign_define('DiagnosticSignHint', { text = '❓', texthl = 'DiagnosticSignHint' })

  for _, server in ipairs(servers) do
    lsp[server.name].setup {
      on_attach = make_on_attach(server.on_attach),
      cmd = server.cmd,
      settings = server.settings,
      capabilities = capabilities
    }
  end
end
