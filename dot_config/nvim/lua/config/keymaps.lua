-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")

wk.add({
  -- navigation
  -- Ctrl+PageUp/PageDown to change tabs (QMK capslock + e/r)
  { "<C-PageUp>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
  { "<C-PageDown>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  { "<M-h>", "zH", desc = "Scroll left horizontally" },
  { "<M-l>", "zL", desc = "Scroll right horizontally" },
})
