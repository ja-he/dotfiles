local get_kurzzug = function()
  return require('lush').compile(require('kurzzug'), { force_clean = true })
end

local get_mono = function()
  return require('lush').compile(require('mono_lush'), { force_clean = true })
end

local themes = {
  fahrenheit = {
    mappings = nil,
    apply = function() vim.cmd([[colorscheme fahrenheit]]) end,
  },
  kurzzug = {
    mappings = get_kurzzug,
    apply = function() vim.cmd([[colo kurzzug]]) end,
  },
  midnight = {
    mappings = nil,
    apply = function() vim.cmd([[colo midnight]]) end,
  },
  mono = {
    mappings = get_mono,
    apply = function() vim.cmd([[colo mono_lush]]) end,
  },
}

return {
  themes = themes,
  auto = function()
    if not vim.fn.has('win32') and os.getenv("DISPLAY") == nil then
      return themes.fahrenheit
    else
      if os.getenv("ZTF_COLO") == 'dark' then
        return themes.kurzzug
      else
        return themes.mono
      end
    end
  end,
  dark = function() return themes.midnight end,
  light = function() return themes.mono end,
  basic = function() return themes.fahrenheit end,
}
