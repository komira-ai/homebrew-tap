class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.185/tierstore-0.3.185-macos-arm64.tar.gz"
      sha256 "384e6cc4b9d3d1c5067774cf47480d221196bdcf8cd5697058f04ca0ed157949"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.185/tierstore-0.3.185-linux-aarch64.tar.gz"
      sha256 "e11fe663333c529a8fd1812c978bba89be6a892bce99f61bdf16622b61826773"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.185/tierstore-0.3.185-linux-x86_64.tar.gz"
      sha256 "88fe326bb7611ad9760decb78f6959cd034fadc57fe8deafacd46d0a1f9a1410"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
