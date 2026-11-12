class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.100/tierstore-0.3.100-macos-arm64.tar.gz"
      sha256 "29e30085c8b6e1ac9024cdcc85885bea004a8126c26df7f92858be28e5ba3819"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.100/tierstore-0.3.100-linux-aarch64.tar.gz"
      sha256 "34cc1b9ac442379d7ea7be099d5b788e43ac8491f8f78985906d26138b8fff33"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.100/tierstore-0.3.100-linux-x86_64.tar.gz"
      sha256 "7fc844ab6a5ae07e4c33e1e18c22bd9b27ed9b4d7169aabde3d711c4eb8c746a"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
