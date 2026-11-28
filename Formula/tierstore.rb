class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.212/tierstore-0.3.212-macos-arm64.tar.gz"
      sha256 "15f6a66576f946d3d6eb54118ef1061dee2ea584e55e1775a6f9ded6dcd09bcd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.212/tierstore-0.3.212-linux-aarch64.tar.gz"
      sha256 "e6650ec61c97b59c2c12feac6e4705572ae3d89aa99502be2688742cf8b9e1a9"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.212/tierstore-0.3.212-linux-x86_64.tar.gz"
      sha256 "ecf48dd1b6c2878283684d4983bd16c7c129025e0ca79fa3bb5c0aadbaff5058"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
