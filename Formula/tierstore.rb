class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.113/tierstore-0.3.113-macos-arm64.tar.gz"
      sha256 "e7108f716481a1929c5de25c796e41e6eada0b93070c54538f705e3e17889ce8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.113/tierstore-0.3.113-linux-aarch64.tar.gz"
      sha256 "0c4be777149f1619fbdd2acfec57475298f9b552ed0239f5cdeef223f4fbec4f"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.113/tierstore-0.3.113-linux-x86_64.tar.gz"
      sha256 "e43d0d9883223d6f099b891fee0b9c5a5e5144a4050aa4dce9292477c7bca971"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
