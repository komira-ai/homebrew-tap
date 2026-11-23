class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.172/tierstore-0.3.172-macos-arm64.tar.gz"
      sha256 "6db7644c917f68cadcb919e5c85c22f394991fd109aa2cb6b58544dfed0a387d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.172/tierstore-0.3.172-linux-aarch64.tar.gz"
      sha256 "bc6707490ae357a5f9b2e09cdd23eb116261def674ca1e7260e231d3c95d5a30"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.172/tierstore-0.3.172-linux-x86_64.tar.gz"
      sha256 "4a22884bcd777ca41884dd3881df22e89c46c881c05c20a8bd78385173d1d2ca"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
