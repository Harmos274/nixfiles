return {
  name = 'texlab',
  settings = {
    texlab = {
      build = {
        executable = 'tectonic',
        args = {
          '%f',
          '--synctex',
          '--keep-logs',
          '--keep-intermediates',
        },
        onSave = true,
      },
    },
  },
}
