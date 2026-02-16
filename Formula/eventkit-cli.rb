class EventkitCli < Formula
  desc "Apple Reminders CLI built on EventKit for automation and AI agents"
  homepage "https://github.com/lokkaflokka/eventkit-cli"
  url "https://github.com/lokkaflokka/eventkit-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "1af84474c7aca898b6173f3ed5b8fbcda2077e3d48163400cd6dced7550349e4"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--build-path", buildpath/"build"
    bin.install buildpath/"build/release/eventkit"
  end

  test do
    assert_match "eventkit 1.1.0", shell_output("#{bin}/eventkit --version")
  end
end
