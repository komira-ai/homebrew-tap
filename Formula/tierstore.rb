class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.176/tierstore-0.3.176-macos-arm64.tar.gz"
      sha256 "86966288a206c1f5a2860057ce9290570f40eba89c122f40d12f07e809d748ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.176/tierstore-0.3.176-linux-aarch64.tar.gz"
      sha256 "81d7a58bfb55b7d9ca7ea5c673e6e09db6263331895b5870f1689df83f28c48b"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.176/tierstore-0.3.176-linux-x86_64.tar.gz"
      sha256 "76ed43ca2087ef26ec097270333b7a2e3e67f3d48eaf4aecc0bd9e9d489f9512"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
