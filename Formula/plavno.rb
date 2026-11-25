class Plavno < Formula
  desc "Terminal music player with service waves and library shuffle"
  homepage "https://github.com/gmelikov/plavno"
  version "0.4.4"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.4/plavno-0.4.4-macos-aarch64.tar.gz"
      sha256 "1f8e57e50fb90710e039945b3fa86d7297b833b7c259ff36feb2bda75772029c"
    end

    on_intel do
      url "https://github.com/gmelikov/plavno/releases/download/v0.4.4/plavno-0.4.4-macos-x86_64.tar.gz"
      sha256 "f1df152df70c406d59d7ed27762d30ce6fbc4d749c19145ae3896380f4a0589b"
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
