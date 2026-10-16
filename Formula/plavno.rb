class Plavno < Formula
  desc "Terminal music player with service waves and library shuffle"
  homepage "https://github.com/gmelikov/plavno"
  version "0.3.1"
  license "Apache-2.0"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/gmelikov/plavno/releases/download/v0.3.1/plavno-0.3.1-macos-aarch64.tar.gz"
      sha256 "f62061475dff2c8e90aef5f360d5f6cddaa4541b53b036e2201bf0edc5346cc6"
    end

    on_intel do
      url "https://github.com/gmelikov/plavno/releases/download/v0.3.1/plavno-0.3.1-macos-x86_64.tar.gz"
      sha256 "a90bd6fda0e1188444c7b8e65822c7abf31cfe1879c58f7811ad4f9ba9a25240"
    end
  end

  def install
    bin.install "plavno", "plavno-spotify", "plavno-youtube"
  end

  def caveats
    <<~EOS
      Install ffmpeg with `brew install ffmpeg` for HLS playback.
      Browser-based sign-in needs Chrome or Chromium.
      The prebuilt binaries are tested on macOS 15.
    EOS
  end

  test do
    assert_match "plavno #{version}", shell_output("#{bin}/plavno --version")
    assert_match "plavno --source SOURCE", shell_output("#{bin}/plavno --help")
    %w[plavno-spotify plavno-youtube].each do |helper|
      assert_match '"error":', pipe_output("#{bin}/#{helper}", "{}\n", 0)
    end
  end
end
