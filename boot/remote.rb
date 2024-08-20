require "foobara/remote_imports"

# Leave off to_import if you want to import all commands in the manifest
# Change cache to false if you want to invalidate the local cache

Foobara::RemoteImports::ImportCommand.run!(
  manifest_url: "https://anthropic-api.playground.foobara.com/manifest",
  to_import: ["CreateMessage"],
  cache: true
)
