class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.205/tierstore-0.3.205-macos-arm64.tar.gz"
      sha256 "0c90a86e57be5a2f744e8e75344be329d598abf2e38532e0f307777987f566a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.205/tierstore-0.3.205-linux-aarch64.tar.gz"
      sha256 "92dbe14cac393dbc7077c85d8439307aff7d44a1beb573ad7875f9c656652e90"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.205/tierstore-0.3.205-linux-x86_64.tar.gz"
      sha256 "e6d93367a436827863b9bd3802a46e5b40c8a0bbd44782c9692eb93b57249b57"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
