class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.72/tierstore-0.3.72-macos-arm64.tar.gz"
      sha256 "488f6cfd183fd0f10cb05574820f1a4826088e6f2e00f9d6d0b530561b3ab80c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.72/tierstore-0.3.72-linux-aarch64.tar.gz"
      sha256 "b97bcb19d131acce849222a5c3bed13f98bf335568f5dabfcf9a2172976c7de3"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.72/tierstore-0.3.72-linux-x86_64.tar.gz"
      sha256 "0c8df8094cf613cebd6da160fb0d37a7f8db56ebeb243d441ef83931ad39e3b2"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
