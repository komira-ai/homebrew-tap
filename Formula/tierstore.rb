class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.193/tierstore-0.3.193-macos-arm64.tar.gz"
      sha256 "1a66d3e9c2d65daf62cb303addad37032ed0a340553527c7ca4e332fca43c4cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.193/tierstore-0.3.193-linux-aarch64.tar.gz"
      sha256 "81fd9afaf855f56eb576c40abc28c956fadd42c5e58a747e8e4f1efc3c6a0f92"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.193/tierstore-0.3.193-linux-x86_64.tar.gz"
      sha256 "119b5698d89f75a27f843ed3440865c2345869d4672361184c6aab91c7a91117"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
