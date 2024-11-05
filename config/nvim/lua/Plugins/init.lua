local function init()
  require 'Plugins.set'
  require 'Plugins.telescope'
  require 'Plugins.tree'
  require 'Plugins.theme'
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
