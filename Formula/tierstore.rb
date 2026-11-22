class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.168/tierstore-0.3.168-macos-arm64.tar.gz"
      sha256 "9f6a64559416fb2835fea4902ac0a3b89ae282a08a33e82d194407cba0d1e0f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.168/tierstore-0.3.168-linux-aarch64.tar.gz"
      sha256 "6750d1fb9bd00381fc00bcf62f1ba904874a33817c4dee61be323b4801426dec"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.168/tierstore-0.3.168-linux-x86_64.tar.gz"
      sha256 "e74a26deedcf37d3296216813bb4678bce4770a0bf68d6a5a3923dab095bc063"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
