class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.206/tierstore-0.3.206-macos-arm64.tar.gz"
      sha256 "83f6eadcdbebc50b368b2d875ac327749743bc06e91aa7322558732aa8cda2a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.206/tierstore-0.3.206-linux-aarch64.tar.gz"
      sha256 "9a9239ed275664ec83c6928bc8c76f9f752ef812bc4bc585922c52f097db1e0d"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.206/tierstore-0.3.206-linux-x86_64.tar.gz"
      sha256 "2092b7d0ca5c1bb349226a9ce73acb56d183f5865b06b700d78b1b9d05fe9dd8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
