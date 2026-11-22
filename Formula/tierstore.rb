class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.166/tierstore-0.3.166-macos-arm64.tar.gz"
      sha256 "470a6b03c67fe1244d5edb2ba375411c741bbdf8d7506f101cd5ca130881f9ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.166/tierstore-0.3.166-linux-aarch64.tar.gz"
      sha256 "1d4350a1a2b8b96ab997c908544802ef6b903181133a56920f3b9acaf628d119"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.166/tierstore-0.3.166-linux-x86_64.tar.gz"
      sha256 "d6f0d75abc117065130ec292cdd536f4d1efa84cba06c646d15226bbb7991738"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
