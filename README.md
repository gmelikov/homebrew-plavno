# plavno Homebrew tap

Binary distribution of [plavno](https://github.com/gmelikov/plavno) for macOS
Apple Silicon and Intel. The formula installs the player and its Spotify and
YouTube helpers. Rust is not required.

```sh
brew install gmelikov/plavno/plavno
```

Update with `brew update && brew upgrade plavno`. Install `ffmpeg` separately
with `brew install ffmpeg` for HLS playback. Browser-based sign-in needs Chrome
or Chromium. The binaries are tested on macOS 15.

The formula is populated automatically after successful stable plavno releases
that include both macOS archives. If `Formula/plavno.rb` is absent, the first
such release has not been published yet; plavno v0.3.0 predates macOS binaries.

The plavno release workflow generates the formula from `SHA256SUMS`, tests
installation on both architectures, and updates this repository using a dedicated
deploy key. This repository also tests formula changes against the public release
downloads. Older release runs cannot downgrade the formula.
