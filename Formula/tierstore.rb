class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.151/tierstore-0.3.151-macos-arm64.tar.gz"
      sha256 "34af5e9a09810557a3d1909073ec9492b691e5ccaa95d3c060fd9fd784c894c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.151/tierstore-0.3.151-linux-aarch64.tar.gz"
      sha256 "5ebc6dc645b81f5100653dc4d0aa4c7d65643d7d3c7568b68291d6654205ecb7"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.151/tierstore-0.3.151-linux-x86_64.tar.gz"
      sha256 "1fe5cb27b56492d4b32441d92c1b82c84907097f2e688ed1b2845da5bde7b9ef"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
