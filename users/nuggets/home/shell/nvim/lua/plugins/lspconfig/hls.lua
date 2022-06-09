return {
  name = 'hls',

  on_attach = function()
    vim.cmd([[
      augroup lspAutoFormat
        autocmd!
      augroup END
      ]])
  end,
}
