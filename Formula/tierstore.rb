class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.199/tierstore-0.3.199-macos-arm64.tar.gz"
      sha256 "1e71a4d1cdc7fab617a726f5c590737c0740032b1325cd78ab92ec86d20abc93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.199/tierstore-0.3.199-linux-aarch64.tar.gz"
      sha256 "87bc5e36c20abccb721ee61dd7926dd6f7b246554de8f2d80b6faf6b614a60a0"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.199/tierstore-0.3.199-linux-x86_64.tar.gz"
      sha256 "e0851e3011c307aaf1ae47a276f2499fe2e803df956710d97faf26bd6d2f4604"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
