class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.171/tierstore-0.3.171-macos-arm64.tar.gz"
      sha256 "d65c5c5ca437283f52c7b6300777bf69ee30762f0849266c184dc4d600009a37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.171/tierstore-0.3.171-linux-aarch64.tar.gz"
      sha256 "07fe1fa988d94eb90797d31fa56b2e01ea2bf9204377a9f60f4f381be741f67c"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.171/tierstore-0.3.171-linux-x86_64.tar.gz"
      sha256 "c688d3e768ad0839417d056920d959f061515a93ea1ea0f06595a8748a46f69f"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
