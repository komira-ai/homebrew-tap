class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.208/tierstore-0.3.208-macos-arm64.tar.gz"
      sha256 "b038b02bd2360758c250d0de6eb3a3af5072e1d832b5412e1ff6fa3aea9cf99f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.208/tierstore-0.3.208-linux-aarch64.tar.gz"
      sha256 "317609af9e26efa59769a3ac2cfa10aa2e08a45df771ec542e0f6027d342e35d"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.208/tierstore-0.3.208-linux-x86_64.tar.gz"
      sha256 "faf66a3d678abd075fae073b7a43e61abd2a33d0f14fcad45fcb375dfb88c257"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
