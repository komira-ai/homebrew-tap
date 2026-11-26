class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.189/tierstore-0.3.189-macos-arm64.tar.gz"
      sha256 "d58c6752c58248365c108a94ae013cc90036dcae6dd5bf5075a1a77c478be05a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.189/tierstore-0.3.189-linux-aarch64.tar.gz"
      sha256 "4c675d7a437cb9484ea0c0ed1568dc25221cd9098a028d2b1ad3617dbc413117"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.189/tierstore-0.3.189-linux-x86_64.tar.gz"
      sha256 "a489c1cf3f13d60b632fd0b146e6264fe98c0dbf23e51ff7b5b898fa4e80a540"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
