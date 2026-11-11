root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
  @just --list --unsorted

# Build the user manual and the visual previews.
doc:
  typst compile docs/manual.typ docs/manual.pdf
  typst compile docs/thumbnail.typ assets/thumbnail.png --ppi 96
  typst compile docs/example.typ assets/example.png

# Compile the example and verify that the packaged template works locally.
test:
  #!/usr/bin/env bash
  set -euo pipefail
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  typst compile docs/example.typ "$tmp/example.pdf"
  typst compile tests/reexports.typ "$tmp/reexports.pdf"
  . scripts/setup
  preview_root="$tmp/packages/preview"
  ./scripts/package "$preview_root"
  package_dir="$preview_root/$PKG_PREFIX/$VERSION"
  test -f "$package_dir/typst.toml"
  test -f "$package_dir/README.md"
  test -f "$package_dir/assets/thumbnail.png"
  test -f "$package_dir/src/lib.typ"
  test -f "$package_dir/template/main.typ"
  test -f "$package_dir/assets/example.png"
  test -f "$package_dir/docs/manual.pdf"
  test ! -e "$package_dir/docs/release.md"
  test ! -e "$package_dir/docs/example.typ"
  typst compile --package-path "$tmp/packages" template/main.typ "$tmp/template.pdf"

# Package the library into the specified destination folder.
package target:
  ./scripts/package "{{target}}"

# Install the library with the "@local" prefix.
install: (package "@local")

# Install the library with the "@preview" prefix for local pre-release testing.
install-preview: (package "@preview")

[private]
remove target:
  ./scripts/uninstall "{{target}}"

# Uninstall the library from the "@local" prefix.
uninstall: (remove "@local")

# Uninstall the library from the "@preview" prefix for local testing.
uninstall-preview: (remove "@preview")

# Run the CI suite and build documentation/previews.
ci: test doc
