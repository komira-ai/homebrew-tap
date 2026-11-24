class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.173/tierstore-0.3.173-macos-arm64.tar.gz"
      sha256 "8719f2aa93564e4d5d8c007731161333f47fc5235e3860dfee6c0d958320a22f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.173/tierstore-0.3.173-linux-aarch64.tar.gz"
      sha256 "735463b49a7928a178def81d09a27b1532265f555e3b88b27d82c0bc905a9f50"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.173/tierstore-0.3.173-linux-x86_64.tar.gz"
      sha256 "d2c4b7dd362523e7b9ceb986376c4226bd4ed2cad77b6061c49a58b7e4f18c9f"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
