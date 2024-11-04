local function init()
  require 'Plugins.set'
  require 'Plugins.theme'
  require 'Plugins.telescope'
  require 'Plugins.lsp'
  require 'Plugins.cmp'
  require 'Plugins.terminal'
  require 'Plugins.language'
  require 'Plugins.nvim_tree'
  require 'Plugins.dev_icons'
end

return {
  init = init
}
