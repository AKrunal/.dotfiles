vim.g.theprimeagen_colorscheme = "gruvbox"

function ColorMyPencils()
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true
    vim.g.gruvbox_invert_selection = "0"
    vim.opt.background = "dark"

    vim.cmd("colorscheme " .. vim.g.theprimeagen_colorscheme)

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    hl("SignColumn", {
        bg = "none",
    })

    hl("ColorColumn", {
        ctermbg = 0,
        bg = "#2f2f2f",
    })

    hl("CursorLineNR", {
        bg = "None",
    })
    hl("Normal", {
        bg = "#252525",
    })

    hl("LineNr", {
        fg = "#5eacd3",
    })

    hl("netrwDir", {
        fg = "#5eacd3",
    })
end

ColorMyPencils()
vim.cmd([[colorscheme gruvbox-baby]])
