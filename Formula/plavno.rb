class Plavno < Formula
  desc "Terminal music player with service waves and library shuffle"
  homepage "https://github.com/gmelikov/plavno"
  version "0.4.0"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.0/plavno-0.4.0-macos-aarch64.tar.gz"
      sha256 "609a554eee7bf967528eeb1d0bae1a7bb01e20d3405f7b46d743d56fae5a4dcb"
    end

    on_intel do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.0/plavno-0.4.0-macos-x86_64.tar.gz"
      sha256 "7f59c3bd7dd6257c0eb3a9d3782e0c848b7feafe43fc8819f2d8cd6716a62d8b"
    end
  end

  def install
    bin.install "plavno", "plavno-spotify"
  end

  def caveats
    <<~EOS
      Install yt-dlp with `brew install yt-dlp` for YouTube playback.
      Install ffmpeg with `brew install ffmpeg` for HLS playback.
      Browser-based sign-in needs Chrome or Chromium.
      The prebuilt binaries are tested on macOS 15.
    EOS
  end

  test do
    assert_match "plavno #{version}", shell_output("#{bin}/plavno --version")
    assert_match "plavno --source SOURCE", shell_output("#{bin}/plavno --help")
    assert_match '"error":', pipe_output("#{bin}/plavno-spotify", "{}\n", 0)
  end
end
