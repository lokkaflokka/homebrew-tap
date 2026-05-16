class EventkitCli < Formula
  desc "Apple Reminders CLI built on EventKit for automation and AI agents"
  homepage "https://github.com/lokkaflokka/eventkit-cli"
  url "https://github.com/lokkaflokka/eventkit-cli/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "d83bc95edbb0c06578306e12a706428695107f187c89a7381e3a164759785459"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--build-path", buildpath/"build"
    bin.install buildpath/"build/release/eventkit"
  end

  test do
    assert_match "eventkit 1.5.0", shell_output("#{bin}/eventkit --version")
  end
end
