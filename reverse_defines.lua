--- Defines reverse lookup table.
-- @module reverse_defines
-- @alias flib_reverse_defines
-- @usage local reverse_defines = require('__flib__.reverse_defines')
local flib_reverse_defines = {}

local function build_reverse_defines(lookup_table, base_table)
  lookup_table = lookup_table or {}
  for k, v in pairs(base_table) do
    if type(v) == "table" then
      lookup_table[k] = {}
      build_reverse_defines(lookup_table[k], v)
    else
      lookup_table[v] = k
    end
  end
end

build_reverse_defines(flib_reverse_defines, defines)

return flib_reverse_defines