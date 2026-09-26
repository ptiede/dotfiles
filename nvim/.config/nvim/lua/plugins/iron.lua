return {
  "Vigemus/iron.nvim",
  ft = { "julia", "python", "sh", "bash", "zsh" },
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          julia = {
            command = { "julia", "--project=." },
          },
          python = {
            command = { "python3" },
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
          },
          sh = { command = { "bash" } },
          bash = { command = { "bash" } },
          zsh = { command = { "zsh" } },
        },
        repl_open_cmd = view.split.rightbelow("%30"),
      },
      keymaps = {
        toggle_repl = "<leader>rr",
        restart_repl = "<leader>rR",
        send_motion = "<leader>sc",
        visual_send = "<leader>sc",
        send_file = "<leader>sf",
        send_line = "<leader>sl",
        send_paragraph = "<leader>sp",
        send_code_block = "<leader>sb",
        send_code_block_and_move = "<leader>sn",
        interrupt = "<leader>s<space>",
        exit = "<leader>sq",
        clear = "<leader>cl",
      },
      highlight = { italic = true },
      ignore_blank_lines = true,
    })

    vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<cr>", { desc = "Focus REPL" })
    vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<cr>", { desc = "Hide REPL" })
  end,
}
