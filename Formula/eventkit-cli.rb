class EventkitCli < Formula
  desc "Apple Reminders CLI built on EventKit for automation and AI agents"
  homepage "https://github.com/lokkaflokka/eventkit-cli"
  url "https://github.com/lokkaflokka/eventkit-cli/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "ddd63fb25df5f3ff9a1a38e5e36d51e87450d0e83c16c223243cc25d84feeb2a"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--build-path", buildpath/"build"
    bin.install buildpath/"build/release/eventkit"
  end

  test do
    assert_match "eventkit 1.3.4", shell_output("#{bin}/eventkit --version")
  end
end
