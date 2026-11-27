class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.204/tierstore-0.3.204-macos-arm64.tar.gz"
      sha256 "5988683b3f487da3263e15657cb05426a3f779b0cc28ef42c4a4058dc0f4efbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.204/tierstore-0.3.204-linux-aarch64.tar.gz"
      sha256 "e762b156f2f668443b6f6ac23d4544b4e3277e46420c979eb52fde5985fd9775"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.204/tierstore-0.3.204-linux-x86_64.tar.gz"
      sha256 "e03a1a3439202143c937d719fb9564809422270cae16568e3d57a8099e75b301"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
