class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.146/tierstore-0.3.146-macos-arm64.tar.gz"
      sha256 "80c434560ac6d6fefa9ff59a16097e0e5712638e857acaab082ba6db5bf63250"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.146/tierstore-0.3.146-linux-aarch64.tar.gz"
      sha256 "242be6a06cc824ed4a4009dd38b165b0b2b78fb062ad489dae146a7c12662244"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.146/tierstore-0.3.146-linux-x86_64.tar.gz"
      sha256 "5cd4a52d1ac6c58ea1743531009618be3cc4166bcb155c52cecfdcc71c13eeee"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
