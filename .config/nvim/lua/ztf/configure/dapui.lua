require'dapui'.setup({
  controls = {
    -- element = "repl",
    -- enabled = true,
    icons = {
      disconnect = "STOP",
      pause = "PAUSE",
      play = "PLAY",
      run_last = "LAST",
      step_back = "BACK",
      step_into = "INTO",
      step_out = "OUT",
      step_over = "OVER",
      terminate = "TERM"
    }
  },
  -- element_mappings = {},
  -- expand_lines = true,
  -- floating = {
  --   border = "single",
  --   mappings = {
  --     close = { "q", "<Esc>" }
  --   }
  -- },
  -- force_buffers = true,
  -- icons = {
  --   collapsed = "",
  --   current_frame = "",
  --   expanded = ""
  -- },
  -- layouts = { {
  --     elements = { {
  --         id = "scopes",
  --         size = 0.25
  --       }, {
  --         id = "breakpoints",
  --         size = 0.25
  --       }, {
  --         id = "stacks",
  --         size = 0.25
  --       }, {
  --         id = "watches",
  --         size = 0.25
  --       } },
  --     position = "left",
  --     size = 40
  --   }, {
  --     elements = { {
  --         id = "repl",
  --         size = 0.5
  --       }, {
  --         id = "console",
  --         size = 0.5
  --       } },
  --     position = "bottom",
  --     size = 10
  --   } },
  -- mappings = {
  --   edit = "e",
  --   expand = { "<CR>", "<2-LeftMouse>" },
  --   open = "o",
  --   remove = "d",
  --   repl = "r",
  --   toggle = "t"
  -- },
  -- render = {
  --   indent = 1,
  --   max_value_lines = 100
  -- }
})
