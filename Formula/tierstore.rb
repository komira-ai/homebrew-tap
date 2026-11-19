class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.147/tierstore-0.3.147-macos-arm64.tar.gz"
      sha256 "816d4221df6366815383a91b47ee94600677a5e00c8fdd180fc89ee47e4581ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.147/tierstore-0.3.147-linux-aarch64.tar.gz"
      sha256 "27520ffe6da64f45a171606e9cb955308db13025d695196accfec9e68b6479ab"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.147/tierstore-0.3.147-linux-x86_64.tar.gz"
      sha256 "20446a26f0843b4593b96ee968a1929db9df03b327218ae3134dd5e593de5a0e"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
