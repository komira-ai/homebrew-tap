class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.157/tierstore-0.3.157-macos-arm64.tar.gz"
      sha256 "62b7d10eee2796ead45fc94038ebbfca4942ddb12cf5e33d4ffbc241cec66daf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.157/tierstore-0.3.157-linux-aarch64.tar.gz"
      sha256 "63e1d2a53d52af2356fa2eb43de26e6b1fc0e530ec59d229a265df6a25ae6bdd"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.157/tierstore-0.3.157-linux-x86_64.tar.gz"
      sha256 "edd82f472b4297f60dc0a88831d6598764ab577d4f27475c7d5df5b58589fcf3"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
