lua <<EOF
  local cmp = require'cmp'
  
  cmp.setup {
    
    mapping = {
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
      ['<CR>'] = cmp.mapping.confirm({select = true}) 
    },
    sources = cmp.config.sources({
      {name = 'nvim_lsp'}, {name = 'buffer'}, {name = 'path'}
    }),
    formatting = {
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

        -- Source
        vim_item.menu = ({buffer = " ", nvim_lsp = " ", path = " "})[entry.source.name]
        
	return vim_item
      end
    }
  }
EOF
