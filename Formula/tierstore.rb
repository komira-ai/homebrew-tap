class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.158/tierstore-0.3.158-macos-arm64.tar.gz"
      sha256 "3679aaa6efd486e5cee2b1a4db40b3c00cb4da3b8849d740211e222d4fa44b86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.158/tierstore-0.3.158-linux-aarch64.tar.gz"
      sha256 "7513660109a2add1d690b40b2388596f370d66ac7d4638f1274e98e31b56bd92"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.158/tierstore-0.3.158-linux-x86_64.tar.gz"
      sha256 "329ba7dd1d90baa057a42cc90540a1f787731e20983ddbbdbe2cf83779bafec1"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
