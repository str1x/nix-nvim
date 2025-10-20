local neoscroll = require('neoscroll')
-- local zenMode = require('zen-mode')
local M = {}

M.getVisualSelection = function()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local isLspDiagnosticsVisible = vim.diagnostic.virtual_text

M.toggleDiagnosticsVisible = function()
  isLspDiagnosticsVisible = not isLspDiagnosticsVisible
  vim.diagnostic.config({
    virtual_text = isLspDiagnosticsVisible,
  })
end

M.showDiagnosticHover = function()
  vim.diagnostic.open_float { border = "rounded" }
end

M.printLSPWorkspaces = function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

--- scroll
---@param scroll number
---@param duration number
M.scroll = function(scroll, duration)
  neoscroll.scroll(scroll, { duration = duration })
end

-- M.toggleZenMode = function()
--   zenMode.toggle({
--     window = {
--       width = .8 -- width will be 85% of the editor width
--     }
--   })
-- end

return M;

