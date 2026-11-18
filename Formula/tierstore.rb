class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.130/tierstore-0.3.130-macos-arm64.tar.gz"
      sha256 "869e78021eeef236002f162cabaa7d01013111a035c87e13fa9c5cf64ef7d44c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.130/tierstore-0.3.130-linux-aarch64.tar.gz"
      sha256 "3ec6001eb46675ac82719458f9509485e6ff4cec1b4ffb910fc767e4b520912d"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.130/tierstore-0.3.130-linux-x86_64.tar.gz"
      sha256 "5eb60532cbb0f49787e9b497556f5da3b8b749eb6edb09af0de9cdcccf6e63f6"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
