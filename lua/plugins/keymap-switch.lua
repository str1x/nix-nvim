---@class DefaultConfig
---@field keymap string
---@field iminsert integer
---@field imsearch integer
---@field format fun(keymap_name:string):string
local config = {
  iminsert = 0,
  imsearch = -1,
  format = function(keymap_name) return keymap_name end,
}

---@class Config
---@field keymap string
---@field format? fun(keymap_name:string):string

---@class KeymapSwitch
---@field setup fun(opts:Config) Setup keymap-switch.nvim
---@field condition fun():boolean Status line condition
---@field provider fun():string Status line provider
---@field switch fun():nil Switch keyboard layout
local M = {}
local switchKey = vim.api.nvim_replace_termcodes('<c-^>', true, true, true)

function M.switch()
  local mode = vim.fn.mode();
  if (mode == 'i' or mode == 'c') then
    vim.api.nvim_feedkeys(switchKey, 'n', false)
    return
  end
  if (mode == 'n') then
    vim.o.iminsert = bit.bxor(vim.o.iminsert, 1)
    return
  end
end

function M.condition()
  return vim.b.keymap_name
    and (
      vim.o.imsearch ~= -1 and vim.fn.mode() == 'c' and vim.o.imsearch == 1
      or vim.o.iminsert == 1
    )
end

function M.provider() return config.format(M.condition() and vim.b.keymap_name or 'en') end

function M.setup(opts)
  vim.validate({
    keymap = { opts.keymap, 'string' },
    format = {
      opts.format,
      function(v) return v == nil or type(v) == 'function' end,
      "'format' must be a function with 1 string argument",
    },
  })

  config.keymap = opts.keymap
  config.format = opts.format or config.format

  vim.o.keymap = config.keymap
  vim.o.iminsert = config.iminsert
  vim.o.imsearch = config.imsearch

  vim.keymap.set(
    {'i', 'n', 'c'},
    '<C-BS>',
    function() M.switch() end,
    { desc = "Toggle keyboard layout"}
  )
end

--- lualine component
function M.kemapStatus()
  local icon = "󰌌"
  local text = string.upper(M.provider());
  local hi_group = M.condition() and 'lualine_a_visual' or 'lualine_a_normal'
  return "%#" .. hi_group .. "# " .. icon .. " " .. text .. " "
end

return M
