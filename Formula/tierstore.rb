class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.96/tierstore-0.3.96-macos-arm64.tar.gz"
      sha256 "2ca230e0cb3a666dde3ea08ff900102c7ae0a9b45f7054cfb67cd010ca835afc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.96/tierstore-0.3.96-linux-aarch64.tar.gz"
      sha256 "dfc90af433864409114b72c6c3f5e0a6ea172c76b4a85bbd887fc8f2978bc6d3"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.96/tierstore-0.3.96-linux-x86_64.tar.gz"
      sha256 "5d3ad7875bb510a0b4953ee6f0a1f1e4817ca1c954be8d93ce3bfdbd2924293b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
