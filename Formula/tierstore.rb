class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.82/tierstore-0.3.82-macos-arm64.tar.gz"
      sha256 "6bb3d39bbf555872f538a1324d2593409f582a023228dca7496e0dccc5fbe928"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.82/tierstore-0.3.82-linux-aarch64.tar.gz"
      sha256 "152ea89ab4df816ec06baaf2741ef93cb2f7caa6e64f435433685b14a765a5dd"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.82/tierstore-0.3.82-linux-x86_64.tar.gz"
      sha256 "e8e520c0e136d45cd02e459313b088e46aedc696fdac8f415a76abdbc78d1339"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
