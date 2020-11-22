require('colorizer').setup(
  {
    '*'; -- Highlight all files
    '!bib'
  },
  {
    mode = 'background',
    rgb_fn = true,
  }
)
