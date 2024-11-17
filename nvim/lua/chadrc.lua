local mappings = require "mappings"
-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

local enable_providers = {
      "python3_provider",
      "node_provider",
      -- and so on
    }
    
    for _, plugin in pairs(enable_providers) do
      vim.g["loaded_" .. plugin] = nil
      vim.cmd("runtime " .. plugin)
    end

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark"
}

-- M.nvdash = {
--   load_on_startup = true;
-- }

M.ui = {
--	theme = "ayu_dark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}
return M
