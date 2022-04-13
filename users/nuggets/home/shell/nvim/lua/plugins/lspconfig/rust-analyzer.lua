return {
  name = 'rust_analyzer',
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = false,
        disabled = {"unresolved-proc-macro"},
        enableExperimental = true,
      }
    }
  }
}
