local copilot = require 'copilot'
local lspconfig = require 'lspconfig'
local rust_tools = require 'rust-tools'
local treesitter = require 'nvim-treesitter.configs'
local treesitter_context = require 'treesitter-context'

local function autocmd(args)
  local event = args[1]
  local group = args[2]
  local callback = args[3]

  vim.api.nvim_create_autocmd(event, {
    group = group,
    buffer = args[4],
    callback = function()
      callback()
    end,
    once = args.once,
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, buffer)
  local augroup_highlight = vim.api.nvim_create_augroup("custom-lsp-references", { clear = true })
  local autocmd_clear = vim.api.nvim_clear_autocmds

  local opts = { buffer = buffer, remap = false }

  -- Enable completion triggered by <c-x><c-o>
  vim.bo[buffer].omnifunc = 'v:lua.vim.lsp.omnifunc'

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

  if client.server_capabilities.documentHighlightProvider then
    autocmd_clear { group = augroup_highlight, buffer = buffer }
    autocmd { "CursorHold", augroup_highlight, vim.lsp.buf.document_highlight, buffer }
    autocmd { "CursorMoved", augroup_highlight, vim.lsp.buf.clear_references, buffer }
  end
end


-- Copilot setup
copilot.setup {
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<C-M>"
    }
  }
}

-- Rust specific setup
rust_tools.setup {
  server = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        diagnostics = {
          enable = false,
        },
        files = {
          excludeDirs = { ".direnv", ".git" },
          watcherExclude = { ".direnv", ".git" },
        },
      },
    },
    on_attach = on_attach,
  },
}

local language_servers = {
  aiken = {},
  bashls = {},
  cssls = {},
  dagger = {},
  elixirls = {
    cmd = { "elixir-ls" },
    flags = {
      debounce_text_changes = 150,
    },
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    },
  },
  html = {},
  jsonls = {},
  jsonnet_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        },
        runtime = {
          version = 'LuaJIT',
        },
        telemetry = {
          enable = false,
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    }
  },
  nil_ls = {
    settings = {
      ['nil'] = {
        formatting = { command = { "nixpkgs-fmt" } },
      },
    }
  },
  ts_ls = {},
  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",                          -- applies to all file types; you can specify file types if needed
  callback = function()
    vim.lsp.buf.format({ async = false }) -- async = false to ensure it waits for format completion before saving
  end,
})

-- Setup Credo linting
lspconfig.efm.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "elixir" }
})

-- Initialize servers
for server, server_config in pairs(language_servers) do
  local config = {}

  if server_config then
    for k, v in pairs(server_config) do
      config[k] = v
    end

    config.on_attach = on_attach
    config.capabilities = capabilities

    lspconfig[server].setup(config)
  end
end

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

treesitter.setup {
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
  ensure_installed = {

  },
  sync_install = true,
  auto_install = false,
  ignore_install = {},
  modules = {}
}

treesitter_context.setup()
