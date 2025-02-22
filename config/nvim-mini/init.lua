-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
    vim.cmd('echo "Installing `mini.nvim`" | redraw')
    local clone_cmd = {
        'git', 'clone', '--filter=blob:none',
        -- Uncomment next line to use 'stable' branch
        -- '--branch', 'stable',
        'https://github.com/echasnovski/mini.nvim', mini_path
    }
    vim.fn.system(clone_cmd)
    vim.cmd('packadd mini.nvim | helptags ALL')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
MiniDeps.add({ name = 'mini.nvim', checkout = 'stable' })

-- TODO : Organize in folders
--

local add, now, later  = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Add to current session (install if absent)
add({
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim' },
})

add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use 'master' while monitoring updates in 'main'
    checkout = 'master',
    monitor = 'main',
    -- Perform action after every checkout
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
-- Possible to immediately execute code which depends on the added plugin
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vimdoc', 'python', 'dockerfile', 'markdown', 'gitcommit', 'gitignore', 'make' },
    highlight = { enable = true },
})
add({ source = "catppuccin/nvim", name = "catppuccin" })




-- [[ Configurations ]]
now(function()
    vim.g.mapleader = " "
    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.autoindent = true
    vim.o.shiftwidth = 4
    vim.o.tabstop = 4
    vim.o.expandtab = true
    vim.o.scrolloff = 10

    vim.o.spelllang="pt,en"

    -- TODO Configure vimtags

    vim.cmd('colorscheme catppuccin-mocha')
end)





-- Safely execute immediately

now(function() require('mini.starter').setup() end)

later(function()
    require("mini.files").setup({
        mappings = {
            close = '<ESC>',
        },
        windows = {
            preview = true,
            border = "solid",
            width_preview = 80,
        },
    })
end)
later(function()
    require("mini.fuzzy").setup()
end)
later(function()
    require("mini.git").setup()
end)

-- Safely execute later
later(function() require('mini.pick').setup() end)
later(function()
    require("mini.diff").setup({
        view = {
            style = "sign",
            signs = { add = "█", change = "▒", delete = "" },
        },
    })
end)

later(function() require('mini.basics').setup() end)
later(function() require('mini.icons').setup() end)
later(function() require('mini.indentscope').setup() end)
later(function() require('mini.misc').setup() end)

later(function()
    --          ┌─────────────────────────────────────────────────────────┐
    --            We took this from echasnovski's personal configuration
    --           https://github.com/echasnovski/nvim/blob/master/init.lua
    --          └─────────────────────────────────────────────────────────┘
    local filterout_lua_diagnosing = function(notif_arr)
        local not_diagnosing = function(notif)
            return not vim.startswith(notif.msg, "lua_ls: Diagnosing")
        end
        notif_arr = vim.tbl_filter(not_diagnosing, notif_arr)
        return MiniNotify.default_sort(notif_arr)
    end
    require("mini.notify").setup({
        content = { sort = filterout_lua_diagnosing },
        window = { config = { border = "solid" } },
    })
    vim.notify = MiniNotify.make_notify()
end)
later(function()
    require("mini.operators").setup()
end)
later(function()
    require("mini.pairs").setup()
end)

-- // TODO Mini.snippets

later(function() require('mini.statusline').setup() end)
later(function() require('mini.tabline').setup() end)


later(function()
    local animate = require("mini.animate")
    animate.setup({
        scroll = {
            -- Disable Scroll Animations, as the can interfer with mouse Scrolling
            enable = false,
        },
        cursor = {
            timing = animate.gen_timing.cubic({ duration = 50, unit = "total" }),
        },
    })
end)

later(function()
    require("mini.clue").setup({
        triggers = {
            -- Leader triggers
            { mode = "n", keys = "<Leader>" },
            { mode = "x", keys = "<Leader>" },

            { mode = "n", keys = "\\" },

            -- Built-in completion
            { mode = "i", keys = "<C-x>" },

            -- `g` key
            { mode = "n", keys = "g" },
            { mode = "x", keys = "g" },

            -- Marks
            { mode = "n", keys = "'" },
            { mode = "n", keys = "`" },
            { mode = "x", keys = "'" },
            { mode = "x", keys = "`" },

            -- Registers
            { mode = "n", keys = '"' },
            { mode = "x", keys = '"' },
            { mode = "i", keys = "<C-r>" },
            { mode = "c", keys = "<C-r>" },

            -- Window commands
            { mode = "n", keys = "<C-w>" },

            -- `z` key
            { mode = "n", keys = "z" },
            { mode = "x", keys = "z" },
        },

        clues = {
            { mode = "n", keys = "<Leader>b", desc = " Buffer" },
            { mode = "n", keys = "<Leader>f", desc = " Find" },
            { mode = "n", keys = "<Leader>g", desc = "󰊢 Git" },
            { mode = "n", keys = "<Leader>i", desc = "󰏪 Insert" },
            { mode = "n", keys = "<Leader>l", desc = "󰘦 LSP" },
            { mode = "n", keys = "<Leader>m", desc = " Mini" },
            { mode = "n", keys = "<Leader>q", desc = " NVim" },
            { mode = "n", keys = "<Leader>s", desc = "󰆓 Session" },
            { mode = "n", keys = "<Leader>u", desc = "󰔃 UI" },
            { mode = "n", keys = "<Leader>w", desc = " Window" },
            require("mini.clue").gen_clues.g(),
            require("mini.clue").gen_clues.builtin_completion(),
            require("mini.clue").gen_clues.marks(),
            require("mini.clue").gen_clues.registers(),
            require("mini.clue").gen_clues.windows(),
            require("mini.clue").gen_clues.z(),
        },
        window = {
            delay = 300,
        },
    })
end)

-- [[ Neovide ]]
--
now(function()
    if vim.g.neovide then
        vim.g.neovide_scroll_animation_length = 0.1
        vim.opt.mousescroll = "ver:10,hor:6"
        vim.opt.linespace = -1
        vim.g.neovide_theme = "dark"

        vim.g.neovide_floating_shadow = true
        vim.g.neovide_floating_z_height = 2
        vim.g.neovide_light_angle_degrees = 45
        vim.g.neovide_light_radius = 15

        vim.g.neovide_floating_blur_amount_x = 10.0
        vim.g.neovide_floating_blur_amount_y = 10.0

        vim.o.guicursor =
        "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait100-blinkoff700-blinkon700-Cursor/lCursor,sm:block-blinkwait0-blinkoff300-blinkon300"
        vim.g.neovide_cursor_animation_length = 0.03
        vim.g.neovide_cursor_smooth_blink = true
        vim.g.neovide_cursor_vfx_mode = "pixiedust"
    end
end)


-- [[ Keymaps -]]
--


-- ╔═══════════════════════╗
-- ║    Local Variables    ║
-- ╚═══════════════════════╝
local keymap = vim.keymap.set

local split_sensibly = function()
    if vim.api.nvim_win_get_width(0) > math.floor(vim.api.nvim_win_get_height(0) * 2.3) then
        vim.cmd("vs")
    else
        vim.cmd("split")
    end
end

--  ─( Colorscheme Picker )─────────────────────────────────────────────
local set_colorscheme = function(name) pcall(vim.cmd, 'colorscheme ' .. name) end
local pick_colorscheme = function()
    local init_scheme = vim.g.colors_name
    local new_scheme = require('mini.pick').start({
        source = {
            items = vim.fn.getcompletion("", "color"),
            preview = function(_, item)
                set_colorscheme(item)
            end,
            choose = set_colorscheme
        },
        mappings = {
            preview = {
                char = '<C-p>',
                func = function()
                    local item = require('mini.pick').get_picker_matches()
                    pcall(vim.cmd, 'colorscheme ' .. item.current)
                end
            }
        }
    })
    if new_scheme == nil then set_colorscheme(init_scheme) end
end

-- ╔═══════════════════════╗
-- ║    General Keymaps    ║
-- ╚═══════════════════════╝
keymap("n", "<leader>q", "<cmd>wqa<cr>", { desc = 'Quit' })
keymap("n", "ö", ":")
keymap("i", "<C-S-v>", "<C-r><C-o>*", { desc = 'Paste from System in Insertmode' })
keymap("n", "<leader>mu", function() require('mini.deps').update() end, { desc = 'Update Plugins' })
keymap("n", "<S-Insert>", "p", { desc = 'Remap Paste for CopyQ' })
keymap("i", "<S-Insert>", "<C-R>+", { desc = 'Remap Paste for CopyQ' })

-- ╔════════════════════╗
-- ║    Find Keymaps    ║
-- ╚════════════════════╝
keymap("n", "<leader>ff", function() require('mini.pick').builtin.files() end,
    { desc = 'Find File' })
keymap("n", "<leader>fr", function() require('mini.pick').builtin.resume() end,
    { desc = 'Find File' })
keymap("n", "<leader>E",
    function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
    end,
    { desc = 'Neotree' }
)
keymap("n", "<leader>e", function()
        local buffer_name = vim.api.nvim_buf_get_name(0)
        if buffer_name == "" or string.match(buffer_name, "Starter") then
            require('mini.files').open(vim.loop.cwd())
        else
            require('mini.files').open(vim.api.nvim_buf_get_name(0))
        end
    end,
    { desc = 'Find Manualy' })
keymap("n", "<leader><space>", function() require('mini.pick').builtin.buffers() end,
    { desc = 'Find Buffer' })
keymap("n", "<leader>fg", function() require('mini.pick').builtin.grep_live() end,
    { desc = 'Find String' })
keymap("n", "<leader>fG", function()
        local wrd = vim.fn.expand("<cword>")
        require('mini.pick').builtin.grep({ pattern = wrd })
    end,
    { desc = 'Find String Cursor' })
keymap("n", "<leader>fh", function() require('mini.pick').builtin.help() end,
    { desc = 'Find Help' })
keymap("n", "<leader>fl", function() require('mini.extra').pickers.hl_groups() end,
    { desc = 'Find HL Groups' })
keymap("n", "<leader>fc", pick_colorscheme, { desc = 'Change Colorscheme' })
keymap('n', ',', function() require('mini.extra').pickers.buf_lines({ scope = 'current' }) end,
    { nowait = true, desc = 'Search Lines' })

-- ╔═══════════════════════╗
-- ║    Session Keymaps    ║
-- ╚═══════════════════════╝
keymap("n", "<leader>ss", function()
    vim.cmd('wa')
    require('mini.sessions').write()
    require('mini.sessions').select()
end, { desc = 'Switch Session' })
keymap("n", "<leader>sw", function()
    local cwd = vim.fn.getcwd()
    local last_folder = cwd:match("([^/]+)$")
    require('mini.sessions').write(last_folder)
end, { desc = 'Save Session' })
keymap("n", "<leader>sf", function()
        vim.cmd('wa')
        require('mini.sessions').select()
    end,
    { desc = 'Load Session' })

-- ╔═══════════════════════╗
-- ║    Editing Keymaps    ║
-- ╚═══════════════════════╝
-- Insert a Password at point
keymap("n", "<leader>ip",
    function()
        local command = 'pwgen -N 1 -B 32'
        for _, line in ipairs(vim.fn.systemlist(command)) do
            vim.api.nvim_put({ line }, '', true, true)
        end
    end,
    { desc = 'Insert Password' })

keymap("n", "YY", "<cmd>%y<cr>", { desc = 'Yank Buffer' })
keymap("n", "<Esc>", "<cmd>noh<cr>", { desc = 'Clear Search' })

-- ╔══════════════════════╗
-- ║    Buffer Keymaps    ║
-- ╚══════════════════════╝
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = 'Close Buffer' })
keymap("n", "<leader>bq", "<cmd>%bd|e#<cr>", { desc = 'Close other Buffers' })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = 'Next Buffer' })
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = 'Previous Buffer' })
keymap("n", "<TAB>", "<C-^>", { desc = "Alternate buffers" })
-- Format Buffer
-- With and without LSP
if vim.tbl_isempty(vim.lsp.get_clients()) then
    keymap("n", "<leader>bf", function() vim.lsp.buf.format() end,
        { desc = 'Format Buffer' })
else
    keymap("n", "<leader>bf", "gg=G<C-o>", { desc = 'Format Buffer' })
end

-- ╔═══════════════════╗
-- ║    Git Keymaps    ║
-- ╚═══════════════════╝
keymap("n", "<leader>gb", function() require('mini.extra').pickers.git_commits({ path = vim.fn.expand('%:p') }) end,
    { desc = 'Git Log this File' })
keymap("n", "<leader>gl", function()
    split_sensibly()
    vim.cmd('terminal lazygit')
end, { desc = 'Lazygit' })
keymap("n", "<leader>gp", "<cmd>:Git pull<cr>", { desc = 'Git Push' })
keymap("n", "<leader>gs", "<cmd>:Git push<cr>", { desc = 'Git Pull' })
keymap("n", "<leader>ga", "<cmd>:Git add .<cr>", { desc = 'Git Add All' })
keymap("n", "<leader>gc", '<cmd>:Git commit -m "Autocommit from MVIM"<cr>',
    { desc = 'Git Autocommit' })
keymap("", "<leader>gh", function() require('mini.git').show_range_history() end,
    { desc = 'Git Range History' })
keymap("n", "<leader>gx", function() require('mini.git').show_at_cursor() end,
    { desc = 'Git Context Cursor' })

-- ╔═══════════════════╗
-- ║    LSP Keymaps    ║
-- ╚═══════════════════╝
keymap("n", "<leader>ld", function() vim.lsp.buf.definition() end,
    { desc = 'Go To Definition' })
keymap("n", "<leader>ls", "<cmd>Pick lsp scope='document_symbol'<cr>",
    { desc = 'Show all Symbols' })
keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = 'Rename This' })
keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,
    { desc = 'Code Actions' })
keymap("n", "<leader>le", function() require('mini.extra').pickers.diagnostic({ scope = "current" }) end,
    { desc = "LSP Errors in Buffer" })
keymap("n", "<leader>lf", function()
    vim.diagnostic.setqflist({ open = true })
end, { desc = "LSP Quickfix" })

-- ╔══════════════════╗
-- ║    UI Keymaps    ║
-- ╚══════════════════╝
-- Window Navigation
keymap("n", "<M-n>", "<cmd>wincmd l<cr>", { desc = 'Focus Left' })
keymap("n", "<M-r>", "<cmd>wincmd k<cr>", { desc = 'Focus Up' })
keymap("n", "<M-t>", "<cmd>wincmd j<cr>", { desc = 'Focus Down' })
keymap("n", "<M-d>", "<cmd>wincmd h<cr>", { desc = 'Focus Right' })

keymap("n", "<leader>ur", "<cmd>colorscheme randomhue<cr>", { desc = 'Random Colorscheme' })

keymap("n", "<leader>wq", "<cmd>wincmd q<cr>", { desc = 'Close Window' })
keymap("n", "<leader>n", "<cmd>noh<cr>", { desc = 'Clear Search Highlight' })

--  ─( Split "Sensibly" )───────────────────────────────────────────────
-- Should automatically split or vsplit based on Ratios
keymap("n", "<leader>bs", split_sensibly, { desc = "Alternate buffers" })

--  ─( Change Colorscheme )─────────────────────────────────────────────
keymap("n", "<leader>ud", "<cmd>set background=dark<cr>", { desc = 'Dark Background' })
keymap("n", "<leader>ub", "<cmd>set background=light<cr>", { desc = 'Light Background' })
keymap("n", "<leader>um", "<cmd>lua MiniMap.open()<cr>", { desc = 'Mini Map' })

--  ─( Neotree )────────────────────────────────────────────────────────
-- keymap("n", "<leader>tt", "<cmd>Neotree toggle<cr>", { desc = 'Neotree' })
keymap("n", "<leader>tt", function()
    local reveal_file = vim.fn.expand('%:p')
    if (reveal_file == '') then
        reveal_file = vim.fn.getcwd()
    else
        local f = io.open(reveal_file, "r")
        if (f) then
            f.close(f)
        else
            reveal_file = vim.fn.getcwd()
        end
    end
    require("neo-tree.command").execute({
        action = "focus",
        source = "filesystel",
        position = "left",
        reveal_file = reveal_file,
        reveal_force_cwd = true,
    })
end, { desc = 'Neotree' })

--  ─( Trying a "Center Code" Keymap )──────────────────────────────────
keymap("n", "<leader>uc", function()
    local margin = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(margin, false, {
        split = 'left',
        win = 0,
        style = 'minimal',
        width = 40
    })
end, { desc = 'Center Buffer' })


--- Resources 
---  https://gitlab.com/domsch1988/mvim/-/blob/main/init.lua?ref_type=heads
