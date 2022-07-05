# nvim
this is my nvim config. for plugins I use (packer)[https://github.com/wbthomason/packer.nvim] 

## useful commands for Packer (plugin manager) 
```
-- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- Regenerate compiled loader file
:PackerCompile

-- Remove any disabled or unused plugins
:PackerClean

-- Clean, then install missing plugins
:PackerInstall

-- Clean, then update and install plugins
:PackerUpdate

-- Perform `PackerUpdate` and then `PackerCompile`
:PackerSync

-- Loads opt plugin immediately
:PackerLoad completion-nvim ale
```


## todos
### set up

- [x] set up [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [ ] mouse support
- [x] dynamic line numbering; rel if in insert, abs if in normal.
- [x] translate config in `init.vim` to lua

### plugins to consider
- [x] [go.vim](https://github.com/ray-x/go.nvim)
- [ ] [vim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- [ ] [ale](https://github.com/dense-analysis/ale)
- [ ] [nerdcommenter](https://github.com/preservim/nerdcommenter)
- [ ] [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [x] [barbar](https://github.com/romgrk/barbar.nvim)
  - looks to be overkill to me


