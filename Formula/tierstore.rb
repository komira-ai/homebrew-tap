class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.183/tierstore-0.3.183-macos-arm64.tar.gz"
      sha256 "159444d9591b91ce6303b5adf8e926631aa85ef864dd01d02450f94f7dfde2b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.183/tierstore-0.3.183-linux-aarch64.tar.gz"
      sha256 "faca2788d80a161511e33ee263d3fb35bf5d1d85a1202b6233bb6e6065d43cbe"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.183/tierstore-0.3.183-linux-x86_64.tar.gz"
      sha256 "273f9fe1cd2e09ae28052c352afde20f163707b0e4c9a9079e332751572a5b23"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
