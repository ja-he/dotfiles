if empty($DISPLAY)
  colorscheme fahrenheit
else
  set background=light
  if &background ==# 'dark'
lua << EOF
    local lush = require('lush')
    local parsed = require('kurzzug')
    local compiled = lush.compile(parsed, {force_clean = true })
    lush.apply(compiled)
EOF
  else
lua << EOF
    local lush = require('lush')
    local parsed = require('mono_lush')
    local compiled = lush.compile(parsed, {force_clean = true })
    lush.apply(compiled)
EOF
  endif
endif

