# Release and Typst Universe submission

The release workflow creates a GitHub Release and can optionally open a draft submission PR against `typst/packages`. The Universe job is deliberately disabled until the repository is configured, so preparing or testing the repo never needs a PAT.

## Configure once in GitHub repository settings

In **Settings → Secrets and variables → Actions** for `bfeitknecht/spicky`, add:

- **Repository secret** `UNIVERSE_TOKEN`: a fine-grained PAT with `Contents: read and write` on the package-registry fork and `Pull requests: read and write` on `typst/packages`. The same token user must be able to push a release branch to the fork and open a PR upstream. If using a classic PAT, it needs `public_repo` access.
- **Repository variable** `UNIVERSE_SUBMIT` with value `true`: enables the submission job. Leave it unset or set to `false` until the token and fork are ready.
- **Repository variable** `UNIVERSE_REPO` (optional): the fork receiving release branches. The default is `github.com/bfeitknecht/packages`. It accepts `owner/repo`, `host/owner/repo`, or a full URL.

The workflow syncs that fork with `typst/packages` before creating the release branch. It creates or updates a branch named `spicky-<version>` and opens or refreshes a draft PR. `UNIVERSE_TOKEN` is only exposed to the submission job. These `UNIVERSE_*` names and scopes are intended to match the `syndicate` and `thyme` repositories; GitHub secrets and variables are repository-specific, so add them in each repository that should submit releases.

## Cut a release

1. Update `typst.toml` and the changelog, then merge the release-ready commit to the default branch.
2. Create and push a version tag matching the package metadata, for example `v0.2.0`. The release workflow validates the tag, compiles the examples, creates the package archive, and publishes a GitHub Release.
3. Once `UNIVERSE_SUBMIT` is enabled and `UNIVERSE_TOKEN` is present, the same run stages the package in `packages/preview/spicky/<version>` and opens the Universe PR.

To retry submission for an existing tag, run **Release & submit to Typst Universe** via `workflow_dispatch` and provide the tag. The package version in `typst.toml` must still match it.

## PAT setup checklist

- [ ] Fork `typst/packages` to `bfeitknecht/packages` (or set `UNIVERSE_REPO`).
- [ ] Create a fine-grained PAT with access to the fork and upstream pull requests.
- [ ] Add it as the `UNIVERSE_TOKEN` secret on this repository.
- [ ] Set `UNIVERSE_SUBMIT=true` only when ready for a tag to create/update a PR.
- [ ] Cut a release tag matching `typst.toml`.
