class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.90/tierstore-0.3.90-macos-arm64.tar.gz"
      sha256 "1f0b7aca4ae7ce5d349e7be7fafb65d6d235a6c0520abc4562e3e2d7784568a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.90/tierstore-0.3.90-linux-aarch64.tar.gz"
      sha256 "9ef73d27b70f74008fabf4780431d9590af16a3ac651d58ca31cd5689156c3e1"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.90/tierstore-0.3.90-linux-x86_64.tar.gz"
      sha256 "ffbdd1c2a67bb1e901fa59db145c2b3169e6867777fbb2d37a1c0a50f15d8242"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
