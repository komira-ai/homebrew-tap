class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.213/tierstore-0.3.213-macos-arm64.tar.gz"
      sha256 "9f3298722a0798725e41e878b52c3db30d8d573c82f45152f82647421510f177"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.213/tierstore-0.3.213-linux-aarch64.tar.gz"
      sha256 "095a11678893e9ee4ecff6f4f281005f4961465410f4cb7752b4df371d667b6a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.213/tierstore-0.3.213-linux-x86_64.tar.gz"
      sha256 "642710208ec93be5f1a6a78b8337d10b539b68eb2799e5a358887794fe40ba00"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
