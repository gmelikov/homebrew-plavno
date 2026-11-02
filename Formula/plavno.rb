class Plavno < Formula
  desc "Terminal music player with service waves and library shuffle"
  homepage "https://github.com/gmelikov/plavno"
  version "0.4.1"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.1/plavno-0.4.1-macos-aarch64.tar.gz"
      sha256 "10c08b5ba52a247136d4dfc030a2c91d36fabcb978940591c56689ad12e60a1d"
    end

    on_intel do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.1/plavno-0.4.1-macos-x86_64.tar.gz"
      sha256 "ad4b0c7d7dc5c7f5d83b6844505c7049423ec1ba581c356567a3ba90c7f81fb4"
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
