class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.191/tierstore-0.3.191-macos-arm64.tar.gz"
      sha256 "f2a0a9ceb96dbd9b7c6697c531928ba2b7576f7c59b1f11b3f2bc3948465af8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.191/tierstore-0.3.191-linux-aarch64.tar.gz"
      sha256 "4ccf62e19b5490eec46022ba0a418f8110995e3f6bb68f8faaf46583cd79cd88"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.191/tierstore-0.3.191-linux-x86_64.tar.gz"
      sha256 "b27b1a6e207133c500b4cbdf5af4d80bc499023f2d34fe2cce005b22b70abb94"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
