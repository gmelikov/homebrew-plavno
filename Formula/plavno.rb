class Plavno < Formula
  desc "Terminal music player with service waves and library shuffle"
  homepage "https://github.com/gmelikov/plavno"
  version "0.4.3"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.3/plavno-0.4.3-macos-aarch64.tar.gz"
      sha256 "b17e7b6a58f0673bdbf95da4494cff5b6bb2a9ebc76a7e3924795b5be1205440"
    end

    on_intel do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.3/plavno-0.4.3-macos-x86_64.tar.gz"
      sha256 "8082159f88aad6f8ee84d030d98232ff65fbbf21fad499e9a7fcb7115891b5c2"
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
