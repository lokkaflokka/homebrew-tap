class EventkitCli < Formula
  desc "Apple Reminders CLI built on EventKit for automation and AI agents"
  homepage "https://github.com/lokkaflokka/eventkit-cli"
  url "https://github.com/lokkaflokka/eventkit-cli/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "ab3d2434ab27836d0a3cca11fa2eb40eaa0895071a700a9ead0b78e97eece741"
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
