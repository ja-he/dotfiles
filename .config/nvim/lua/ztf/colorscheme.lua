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
    apply = function() require('lush').apply(get_kurzzug()) end,
  },
  mono = {
    mappings = get_mono,
    apply = function() require('lush').apply(get_mono()) end,
  },
}

if os.getenv("DISPLAY") == nil then
  return themes.nodisplay
else
  if os.getenv("ZTF_COLO") == 'dark' then
    return themes.kurzzug
  else
    return themes.mono
  end
end
