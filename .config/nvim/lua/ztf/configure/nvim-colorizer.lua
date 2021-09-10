require('colorizer').setup(
  {
    '*'; -- Highlight all files
    '!bib'
  },
  {
    mode = 'background',

    RGB = true,
    RRGGBB = true,
    rgb_fn = true,
    RRGGBBAA = true,

    names = true,

    hsl_fn = true,

    css = true,
    css_fn = true,
  }
)
