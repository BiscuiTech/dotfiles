vim.lsp.config('rust_analyzer', {
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
        features = { "ssr" }
      },
      -- Other Settings ...
      procMacro = {
        ignored = {
          leptos_macro = {
            -- optional: --
            "component",
            "server",
          },
        },
      },
    }
  }
})
