local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require 'telescope.config'.values

local M = {}

local z_files = function(_)
  local output = vim.fn.system("z enumerate-files --k --file-name --file-type --full-path")

  local results = {}
  for line in output:gmatch("[^\r\n]+") do
    local result = {}
    for d in line:gmatch("[^\t]+") do
      table.insert(result, d)
    end
    table.insert(results, result)
  end

  return results
end

local z_file_picker = function(opts)
  opts = opts or {}

  pickers.new(opts, {
    prompt_title = "z files",
    finder = finders.new_table({
      results = z_files(),
      entry_maker = function (entry)
        return {
          value = entry[4],
          display = entry[1].."\t"..entry[2].."\t"..entry[3],
          ordinal = entry[1].."\t"..entry[2].."\t"..entry[3],
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),
  }):find()
end

M.z_file_picker = z_file_picker

return M
