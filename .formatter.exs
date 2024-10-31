[
  import_deps: [:phoenix],
  subdirectories: ["priv/*/migrations", "priv/*/seed"],
  plugins: [Styler],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "priv/*/seeds.exs"],
  line_length: 120
]
