class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.140/tierstore-0.3.140-macos-arm64.tar.gz"
      sha256 "a9caf35e63bb6223ed26f82d1fa9ad15d1ff2264153a901e95962de581e6d597"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.140/tierstore-0.3.140-linux-aarch64.tar.gz"
      sha256 "82563c365a435f5038be76275d3be5397b57e094f4d4ac99b40d3365dc70d204"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.140/tierstore-0.3.140-linux-x86_64.tar.gz"
      sha256 "67046f9cd214d9ea17da775a00f8527d042f78b7ea0f6bed39c78c2b93690015"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
