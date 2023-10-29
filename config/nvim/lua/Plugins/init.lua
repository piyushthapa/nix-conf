local function init()
  require 'Plugins.set'
  require 'Plugins.theme'
  require 'Plugins.telescope'
  require 'Plugins.lsp'
  require 'Plugins.terminal'
  require 'Plugins.language'
end

return {
  init = init
}
