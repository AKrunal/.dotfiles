--dap-go
local function golang()
    require("dap-go").setup({})
end

local function python()
    require("dap-python").setup("~/temp/.virtualenvs/debugpy/bin/python")
end

local function rust()
    local opts = {
        tools = {

            executor = require("rust-tools/executors").termopen,

            on_initialized = nil,

            reload_workspace_from_cargo_tomld = true,

            inlay_hints = {
                auto = true,

                only_current_line = false,

                show_parameter_hints = true,

                parameter_hints_prefix = "<- ",

                other_hints_prefix = "=> ",

                max_len_align = false,

                max_len_align_padding = 1,

                right_align = false,

                right_align_padding = 7,

                highlight = "Comment",
            },

            hover_actions = {

                border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                },

                auto_focus = false,
            },

            crate_graph = {
                backend = "x11",
                output = nil,
                full = true,

                enabled_graphviz_backends = {
                    "bmp",
                    "cgimage",
                    "canon",
                    "dot",
                    "gv",
                    "xdot",
                    "xdot1.2",
                    "xdot1.4",
                    "eps",
                    "exr",
                    "fig",
                    "gd",
                    "gd2",
                    "gif",
                    "gtk",
                    "ico",
                    "cmap",
                    "ismap",
                    "imap",
                    "cmapx",
                    "imap_np",
                    "cmapx_np",
                    "jpg",
                    "jpeg",
                    "jpe",
                    "jp2",
                    "json",
                    "json0",
                    "dot_json",
                    "xdot_json",
                    "pdf",
                    "pic",
                    "pct",
                    "pict",
                    "plain",
                    "plain-ext",
                    "png",
                    "pov",
                    "ps",
                    "ps2",
                    "psd",
                    "sgi",
                    "svg",
                    "svgz",
                    "tga",
                    "tiff",
                    "tif",
                    "tk",
                    "vml",
                    "vmlz",
                    "wbmp",
                    "webp",
                    "xlib",
                    "x11",
                },
            },
        },

        server = {
            standalone = true,
        },

        dap = {
            adapter = {
                type = "executable",
                command = "lldb-vscode",
                name = "rt_lldb",
            },
        },
    }

    require("rust-tools").setup(opts)
    local rt = require("rust-tools")

    rt.setup({
        server = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
        },
    })
end


local function c()
    require("dap-lldb").setup({
        type = "executable",
        command = "/usr/bin/lldb-vscode",
        name = "lldb",
    })
end

local M = {}

function M.setup()
    golang()
    python()
    rust()
    --c()
end

return M
