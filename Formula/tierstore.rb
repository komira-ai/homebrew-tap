class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.108/tierstore-0.3.108-macos-arm64.tar.gz"
      sha256 "488447d1f0999c162abd5e245fb94fd30fef124fc289345a2c10960d28082f2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.108/tierstore-0.3.108-linux-aarch64.tar.gz"
      sha256 "27736cd5ec4a84ea43f2ee3975caa384ba5794c15038e674a2689a90f23c27cd"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.108/tierstore-0.3.108-linux-x86_64.tar.gz"
      sha256 "5131a5272797322578ff78251c4a3c73ac33b0397f934aa7e77b5d34d4c8a2ba"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
