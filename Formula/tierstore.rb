class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.155/tierstore-0.3.155-macos-arm64.tar.gz"
      sha256 "319df3c3a55141e969b5bf55c1e6dd32e9d5d118626a9bbff9be671d1cbb7e23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.155/tierstore-0.3.155-linux-aarch64.tar.gz"
      sha256 "9192ce38d9477879997575afa07ddb82c37bcc4781fafd9f7368acce36991b28"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.155/tierstore-0.3.155-linux-x86_64.tar.gz"
      sha256 "f478fd34cb9e692e852087d734f86f4259ac90c1709ea1fb8703778d46082bdd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
