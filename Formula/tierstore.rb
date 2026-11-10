class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.89/tierstore-0.3.89-macos-arm64.tar.gz"
      sha256 "330a43719229ed0015a1280be8e8b63279d6afed1b7d2dc4817a5d1b3233d8c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.89/tierstore-0.3.89-linux-aarch64.tar.gz"
      sha256 "50b7ad10fc32746d7e4b3439c4288b70ab4768bc0951bf0a2c999d1461486465"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.89/tierstore-0.3.89-linux-x86_64.tar.gz"
      sha256 "dde938d5330f6cb15dda3cc01ba83a61b8165e419172944a9ff5f8889da611d3"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
