vim.g.mapleader = " "
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    if packer_bootstrap then
        require('packer').sync()
    end
    --basic
    use 'wbthomason/packer.nvim'
    use 'https://github.com/luisiacc/gruvbox-baby.git'
    use 'https://github.com/folke/tokyonight.nvim.git'
    use 'https://github.com/vim-airline/vim-airline.git'
    use 'vim-airline/vim-airline-themes'
    use 'jiangmiao/auto-pairs' -- { to {} commplate
    use 'https://github.com/mbbill/undotree.git'
    use 'https://github.com/preservim/tagbar.git'


    ----coc
    use { 'neoclide/coc.nvim', branch = 'release' }


    ---- fuzzy finder
    use 'https://github.com/nvim-telescope/telescope.nvim.git'
    use 'nvim-lua/plenary.nvim'
    use 'fannheyward/telescope-coc.nvim'
    use 'https://github.com/kyazdani42/nvim-web-devicons.git'


    ----github
    use 'https://github.com/airblade/vim-gitgutter.git'
    use 'tpope/vim-fugitive'
    use 'ThePrimeagen/git-worktree.nvim'
    use 'https://github.com/tpope/vim-rhubarb.git'


    ----extra feture
    use 'ThePrimeagen/harpoon'
    use 'https://github.com/ThePrimeagen/refactoring.nvim.git'
    use 'https://github.com/nvim-treesitter/nvim-treesitter.git'
    use 'scrooloose/nerdcommenter'


    ----lsp
    use 'https://github.com/neovim/nvim-lspconfig.git'
    --use 'https://github.com/github/copilot.vim.git'


    ----formater
    use 'https://github.com/prettier/vim-prettier.git'

    ----debug
    use 'https://github.com/mfussenegger/nvim-dap.git'
    use 'https://github.com/nvim-telescope/telescope-dap.nvim.git'
    use 'https://github.com/rcarriga/nvim-dap-ui.git'
    use 'https://github.com/leoluz/nvim-dap-go.git' --go-dap
    use 'https://github.com/mfussenegger/nvim-dap-python.git'


    ----for go only
    use 'https://github.com/fatih/vim-go.git'

    ----for display
    use 'https://github.com/junegunn/goyo.vim.git'
    use 'https://github.com/junegunn/limelight.vim.git'


    ----my plug
    use '/home/kishan/Personal/Projects/notification'
    use 'https://github.com/nvim-lua/plenary.nvim.git'


    ----lua with help
    use 'https://github.com/nanotee/luv-vimdocs.git'
    use 'https://github.com/milisims/nvim-luaref.git'
    use { "williamboman/mason.nvim" }
end),
    require('kishan')
