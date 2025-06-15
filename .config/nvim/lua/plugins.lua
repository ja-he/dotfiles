-- vim:foldmethod=indent

local plugins = {

  -- git
  {
    'tpope/vim-fugitive',
    lazy = true,
    cmd = { "G", "Git", "Gedit" },
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function() require("ztf.configure.gitsigns") end,
    lazy = false,
  },
  {
    'rhysd/git-messenger.vim',
    config = function() vim.cmd("source " .. vim.fn.stdpath('config') .. "/configure/git-messenger.vim") end,
  },

  -- stuff?
  {
    'vim-pandoc/vim-pandoc-syntax',
    lazy = true,
    ft = 'markdown',
  },
  'chrisbra/unicode.vim',
  'kylelaker/riscv.vim',
  { 'norcalli/nvim-colorizer.lua', config = function() require('ztf.configure.nvim-colorizer') end },
  { 'numToStr/Comment.nvim',       config = function() require("ztf.configure.comment") end },
  'tpope/vim-surround',
  'tpope/vim-characterize',
  'tommcdo/vim-lion',

  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      automatic_enable = false, -- at least for now, I still have my own
      ensure_installed = {
        "tinymist",
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "sqls",
      },
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      require("ztf.lsp")
    end,
  },
  {
    'mfussenegger/nvim-dap',
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {},
  },
  -- rust
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
    dependencies = { 'mfussenegger/nvim-dap', 'neovim/nvim-lspconfig' },
    -- TODO: somehow might need to add this to setup
    --
    --     lspconfig.rust_analyzer.setup {
    --       -- Other Configs ...
    --       settings = {
    --         ["rust-analyzer"] = {
    --           -- Other Settings ...
    --           procMacro = {
    --             ignored = {
    --               leptos_macro = {
    --                 -- optional: --
    --                 -- "component",
    --                 "server",
    --               },
    --             },
    --           },
    --         },
    --       }
    --     }
  },
  -- java 🤮
  {
    'mfussenegger/nvim-jdtls',
    lazy = true,
    ft = 'java',
  },
  -- go
  {
    'leoluz/nvim-dap-go',
    lazy = true,
    ft = 'go',
    opts = {
      -- Additional dap configurations can be added.
      -- dap_configurations accepts a list of tables where each entry
      -- represents a dap configuration. For more details do:
      -- :help dap-configuration
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        build_flags = "",
      },
    },
    dependencies = { 'mfussenegger/nvim-dap' },
  },
  {
    'rafaelsq/nvim-goc.lua',
    lazy = true,
    config = function() require("ztf.configure.nvim-goc") end,
  },
  -- lua
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { plugins = { "nvim-dap-ui" }, types = true },
      },
    },
  },
  { -- optional `vim.uv` typings
    "Bilal2453/luvit-meta",
    lazy = true
  },
  { -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },

  -- nushell
  {
    'LhKipp/nvim-nu',
  },

  -- null-ls (rip)
  {
    'nvimtools/none-ls.nvim',
    lazy = true,
    ft = { 'go', 'gitcommit', 'sh' },
    config = function()
      local ls = require 'null-ls'
      ls.setup({
        sources = {
          ls.builtins.diagnostics.revive,
          ls.builtins.diagnostics.staticcheck,
          ls.builtins.code_actions.shellcheck,
        },
      })
    end,
  },

  -- cmp
  {
    'hrsh7th/nvim-cmp',
    config = function() require("ztf.configure.nvim-cmp") end,
    dependencies = {
      'onsails/lspkind.nvim',
      config = function()
        require 'lspkind'.init({
          symbol_map = {
            Copilot = "",
          },
        })
      end,
    },
  },
  { 'hrsh7th/cmp-nvim-lsp',                dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-buffer',                  dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-path',                    dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-cmdline',                 dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-nvim-lsp-signature-help', dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'hrsh7th/cmp-emoji',                   dependencies = { 'hrsh7th/nvim-cmp' } },
  { 'saadparwaiz1/cmp_luasnip',            dependencies = { 'L3MON4D3/LuaSnip', 'hrsh7th/nvim-cmp' }, },

  -- luasnip
  {
    'L3MON4D3/LuaSnip',
    config = function() require("ztf.configure.luasnip") end,
    dependencies = { 'rafamadriz/friendly-snippets' },
  },

  -- DB viewing
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = { 'tpope/vim-dadbod', lazy = true },
    lazy = true,
    cmd =
    'DBUIToggle'
  },

  -- { 'github/copilot.vim',              lazy = true,                                                 cmd = 'Copilot' },
  {
    "zbirenbaum/copilot-cmp",
    opts = {},
    cmd = "Copilot",
    dependencies = {
      "hrsh7th/nvim-cmp",
      {
        "zbirenbaum/copilot.lua",
        opts = {
          suggestion = { enabled = false, },
          panel = { enabled = false, },
        },
      },
    },
  },
  {
    'voldikss/vim-floaterm',
    config = function() vim.cmd("source " .. vim.fn.stdpath('config') .. "/configure/floaterm.vim") end,
  },
  {
    'dstein64/nvim-scrollview',
    lazy = true,
    cmd =
    'ScrollViewToggle'
  },
  {
    'rktjmp/lush.nvim'
  },

  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-treesitter/playground',      dependencies = { 'nvim-treesitter/nvim-treesitter' } },

  {
    'https://github.com/nat-418/boole.nvim',
    config = function()
      require('boole').setup({
        mappings = { increment = '<c-a>', decrement = '<c-x>' },
        -- User defined loops
        additions = {
          { 'feat', 'fix', 'refactor', 'style', 'doc', 'test', 'ci', 'chore' },
        },
      })
    end
  },

  -- searching
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    config = function() require("ztf.configure.telescope") end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && '
        .. 'cmake --build build --config Release && '
        .. 'cmake --install build --prefix build',
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
  {
    'junegunn/fzf', -- this contains a small basic vim plugin, so it is needed
    -- build = 'call fzf#install()', -- this step is not needed, as pacman should keep us on a reasonably current version of the fzf binary
  },
  {
    'junegunn/fzf.vim',
    config = function() vim.cmd("source " .. vim.fn.stdpath('config') .. "/configure/fzf.vim") end,
  },
  {
    'stevearc/oil.nvim',
    opts = {
      -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
      -- Set to false if you still want to use netrw.
      default_file_explorer = true,
      -- Id is automatically added at the beginning, and name at the end
      -- See :help oil-columns
      columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      -- Buffer-local options to use for oil buffers
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      -- Window-local options to use for oil buffers
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
      delete_to_trash = false,
      -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
      skip_confirm_for_simple_edits = false,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      -- (:help prompt_save_on_select_new_entry)
      prompt_save_on_select_new_entry = true,
      -- Oil will automatically delete hidden buffers after this delay
      -- You can set the delay to false to disable cleanup entirely
      -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
      cleanup_delay_ms = 2000,
      lsp_file_methods = {
        -- Time to wait for LSP file operations to complete before skipping
        timeout_ms = 1000,
        -- Set to true to autosave buffers that are updated with LSP willRenameFiles
        -- Set to "unmodified" to only save unmodified buffers
        autosave_changes = false,
      },
      -- Constrain the cursor to the editable parts of the oil buffer
      -- Set to `false` to disable, or "name" to keep it on the file names
      constrain_cursor = "editable",
      -- Set to true to watch the filesystem for changes and reload oil
      experimental_watch_for_changes = false,
      -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
      -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
      -- Additionally, if it is a string that matches "actions.<name>",
      -- it will use the mapping at require("oil.actions").<name>
      -- Set to `false` to remove a keymap
      -- See :help oil-actions for a list of all available actions
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      -- Set to false to disable all of the above keymaps
      use_default_keymaps = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = false,
        -- This function defines what is considered a "hidden" file
        is_hidden_file = function(name, bufnr)
          return vim.startswith(name, ".")
        end,
        -- This function defines what will never be shown, even when `show_hidden` is set
        is_always_hidden = function(name, bufnr)
          return false
        end,
        -- Sort file names in a more intuitive order for humans. Is less performant,
        -- so you may want to set to false if you work with large directories.
        natural_order = true,
        sort = {
          -- sort order can be "asc" or "desc"
          -- see :help oil-columns to see which columns are sortable
          { "type", "asc" },
          { "name", "asc" },
        },
      },
      -- Extra arguments to pass to SCP when moving/copying files over SSH
      extra_scp_args = {},
      -- EXPERIMENTAL support for performing file operations with git
      git = {
        -- Return true to automatically git add/mv/rm files
        add = function(path)
          return false
        end,
        mv = function(src_path, dest_path)
          return false
        end,
        rm = function(path)
          return false
        end,
      },
      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
      -- Configuration for the actions floating preview window
      preview = {
        -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_width and max_width can be a single value or a list of mixed integer/float types.
        -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
        max_width = 0.9,
        -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
        min_width = { 40, 0.4 },
        -- optionally define an integer/float for the exact width of the preview window
        width = nil,
        -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        -- min_height and max_height can be a single value or a list of mixed integer/float types.
        -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
        max_height = 0.9,
        -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
        min_height = { 5, 0.1 },
        -- optionally define an integer/float for the exact height of the preview window
        height = nil,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- Whether the preview window is automatically updated when the cursor is moved
        update_on_cursor_moved = true,
      },
      -- Configuration for the floating progress window
      progress = {
        max_width = 0.9,
        min_width = { 40, 0.4 },
        width = nil,
        max_height = { 10, 0.9 },
        min_height = { 5, 0.1 },
        height = nil,
        border = "rounded",
        minimized_border = "none",
        win_options = {
          winblend = 0,
        },
      },
      -- Configuration for the floating SSH window
      ssh = {
        border = "rounded",
      },
      -- Configuration for the floating keymaps help window
      keymaps_help = {
        border = "rounded",
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- ui stuff
  'stevearc/dressing.nvim',
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 1.0,
        options = {
          signcolumn = "no",      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false,     -- disable whitespace characters
        },
      },
      plugins = {
        gitsigns = { enabled = true },
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'pocco81/true-zen.nvim',
    config = function() require("ztf.configure.true-zen") end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require("ztf.configure.lualine") end,
  },
  { "rktjmp/shipwright.nvim" },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      text = { spinner = "dots_pulse" },
    },
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      highlight = {
        ui = "String",
        search = "DiffDelete",
        replace = "DiffAdd"
      },
    },
  },

  -- colorschemes
  { 'ja-he/kurzzug', dependencies = 'rktjmp/lush.nvim' },
  { 'Shatur/neovim-ayu', },
  { 'fcpg/vim-fahrenheit', },

  -- play around
  {
    'Eandrju/cellular-automaton.nvim',
    lazy = true,
    cmd =
    'CellularAutomaton'
  },

  'NoahTheDuke/vim-just',
  'IndianBoy42/tree-sitter-just',

  'kaarmu/typst.vim',

  'ja-he/mediate.nvim',
  {
    'ja-he/heat.nvim',
    config = function() require("ztf.configure.heat") end,
  },

  { 'tweekmonster/startuptime.vim', lazy = true, cmd = 'StartupTime' },

  { 'mbbill/undotree' },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
      provider = "claude", -- Recommend using Claude
      auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        temperature = 0,
        max_tokens = 4096,
      },
      ---Specify the special dual_boost mode
      ---1. enabled: Whether to enable dual_boost mode. Default to false.
      ---2. first_provider: The first provider to generate response. Default to "openai".
      ---3. second_provider: The second provider to generate response. Default to "claude".
      ---4. prompt: The prompt to generate response based on the two reference outputs.
      ---5. timeout: Timeout in milliseconds. Default to 60000.
      ---How it works:
      --- When dual_boost is enabled, avante will generate two responses from the first_provider and second_provider respectively. Then use the response from the first_provider as provider1_output and the response from the second_provider as provider2_output. Finally, avante will generate a response based on the prompt and the two reference outputs, with the default Provider as normal.
      ---Note: This is an experimental feature and may not work as expected.
      dual_boost = {
        enabled = false,
        first_provider = "openai",
        second_provider = "claude",
        prompt =
        "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000, -- Timeout in milliseconds
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right", -- the position of the sidebar
        wrap = true,        -- similar to vim.o.wrap
        width = 30,         -- default % based on available width
        sidebar_header = {
          enabled = true,   -- true, false to enable/disable the header
          align = "center", -- left, center, right for title
          rounded = true,
        },
        input = {
          prefix = "> ",
          height = 8, -- Height of the input window in vertical layout
        },
        edit = {
          border = "rounded",
          start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
          floating = false,    -- Open the 'AvanteAsk' prompt in a floating window
          start_insert = true, -- Start insert mode when opening the ask window
          border = "rounded",
          ---@type "ours" | "theirs"
          focus_on_apply = "ours", -- which diff to focus after applying
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    "max397574/colortils.nvim",
    cmd = "Colortils",
    opts = {
      mappings = {
        -- increment values
        increment = "l",
        -- decrement values
        decrement = "h",
        -- increment values with bigger steps
        increment_big = "L",
        -- decrement values with bigger steps
        decrement_big = "H",
        -- set values to the minimum
        min_value = "0",
        -- set values to the maximum
        max_value = "$",
        -- save the current color in the register specified above with the format specified above
        set_register_default_format = "<cr>",
        -- save the current color in the register specified above with a format you can choose
        set_register_choose_format = "g<cr>",
        -- replace the color under the cursor with the current color in the format specified above
        replace_default_format = "<s-cr>",
        -- replace the color under the cursor with the current color in a format you can choose
        replace_choose_format = "g<s-cr>",
        -- export the current color to a different tool
        export = "E",
        -- set the value to a certain number (done by just entering numbers)
        set_value = "c",
        -- toggle transparency
        transparency = "T",
        -- choose the background (for transparent colors)
        choose_background = "B",
      },
    },
  },

}

require('lazy').setup(plugins)
