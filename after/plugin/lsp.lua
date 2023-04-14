local lsp = require("lsp-zero")
local util = require("lspconfig.util")
local mason_null_ls = require("mason-null-ls")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "eslint"
})


mason_null_ls.setup({
  ensure_installed = { "prettier" },
  automatic_setup = true
})

mason_null_ls.setup_handlers()

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<CR>"] = cmp.mapping.confirm({ select = true }),
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "E",
    warn = "W",
    hint = "H",
    info = "I",
  },
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
})


lsp.configure("denols", {
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
})

lsp.configure("tsserver", {
  single_file_support = false,
  root_dir = util.root_pattern("package.json"),
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
