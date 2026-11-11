class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.94/tierstore-0.3.94-macos-arm64.tar.gz"
      sha256 "7ff3bc8ca6db5122cc6552fdaafadb5b93543d3e31b9ebe3dd58e045682e9bb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.94/tierstore-0.3.94-linux-aarch64.tar.gz"
      sha256 "8f1053bfde0dd254f4818940e280fe7d3f2ef8547e3f9ff265af826aa3040128"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.94/tierstore-0.3.94-linux-x86_64.tar.gz"
      sha256 "f08d96eea3b825af5228357cd09423a881e459fa78f14b70922653c7a669837f"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
