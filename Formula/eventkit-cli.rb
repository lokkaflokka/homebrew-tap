class EventkitCli < Formula
  desc "Apple Reminders CLI built on EventKit for automation and AI agents"
  homepage "https://github.com/lokkaflokka/eventkit-cli"
  url "https://github.com/lokkaflokka/eventkit-cli/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "b42b483e76790c000534fbfa334752091e84b9d44a3ebfa7801c97a2f8c7fb17"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--build-path", buildpath/"build"
    bin.install buildpath/"build/release/eventkit"
  end

  test do
    assert_match "eventkit 1.3.2", shell_output("#{bin}/eventkit --version")
  end
end
