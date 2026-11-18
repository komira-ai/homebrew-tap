class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.132/tierstore-0.3.132-macos-arm64.tar.gz"
      sha256 "05759fc8d911a5d5b7c36971012d8d14d9b06901ff25e2af956a4525720d3923"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.132/tierstore-0.3.132-linux-aarch64.tar.gz"
      sha256 "9c7c9452f2d9b3d079b0a64f1f35b62aa2580364b164cf9f53936a3d5317855a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.132/tierstore-0.3.132-linux-x86_64.tar.gz"
      sha256 "710adfed0dbdd90a098cae4a1dc36476b29a701eae7491306ffdb98ebe188d87"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
