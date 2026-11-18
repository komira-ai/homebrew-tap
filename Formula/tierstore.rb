class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.133/tierstore-0.3.133-macos-arm64.tar.gz"
      sha256 "d572b585d1161c524cb051e52eecc9a1f129efc0ba9caed07198ed6a06c937f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.133/tierstore-0.3.133-linux-aarch64.tar.gz"
      sha256 "d57dccdfaa8a32ba511b91d3d7e91e69583a485b4f0269d4f4d3a808df87d0a1"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.133/tierstore-0.3.133-linux-x86_64.tar.gz"
      sha256 "4285bbc97f0503a779fdae89e0cdcbbda4e0063ee87efa75168f5f634d45652b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
