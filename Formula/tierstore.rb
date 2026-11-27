class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.192/tierstore-0.3.192-macos-arm64.tar.gz"
      sha256 "920b7a38ccc10a191b9827bb15a3eb5df96b7bc31598516135845e52aa5a57f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.192/tierstore-0.3.192-linux-aarch64.tar.gz"
      sha256 "bda7d6b1f667f35b5e104c97886c937b51f4cff3b6c3bd79651dfed499cd6960"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.192/tierstore-0.3.192-linux-x86_64.tar.gz"
      sha256 "0c186f8a2b047822848fc810221546657203e0d6a551837816ced00b4729dd66"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
