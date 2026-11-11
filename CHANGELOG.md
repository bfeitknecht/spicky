# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Configurable page layout, typography, heading numbering, and page numbering in `conf`.
- `pseudocode` as a descriptive alias for the existing `pseudo` helper.
- Release preparation for optional Typst Universe submissions using the `UNIVERSE_*` settings.

### Changed

- Updated the template artwork to a centered 3:2 thumbnail that fits Typst Universe cards.
- Refreshed the README, starter template, example, and manual.
- Replaced grayscale container fills with restrained semantic colors; each container remains customizable.
- Package archives retain the rendered README example, template thumbnail, and PDF manual while omitting local build output.

### Fixed

- Corrected the example's local import path and expanded package smoke checks.
- Prevented package builds from recursively including their own output or targeting the project root.

## [0.1.0] - 2026-07-23

### Added

- Initial release of the `spicky` cheatsheet helpers and template.

[Unreleased]: https://github.com/bfeitknecht/spicky/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/bfeitknecht/spicky/releases/tag/v0.1.0
