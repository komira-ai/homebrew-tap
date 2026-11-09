class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.78/tierstore-0.3.78-macos-arm64.tar.gz"
      sha256 "66c2b31dc1c5090ab3165ddb091654c3d4817db018f4cf3e586474dddbf4bfd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.78/tierstore-0.3.78-linux-aarch64.tar.gz"
      sha256 "eb1b2fff84b7ea384f8955ec0bd6faaf03a4db97bce54a9d94aed53557473e63"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.78/tierstore-0.3.78-linux-x86_64.tar.gz"
      sha256 "46bcd8959308ce23746e4666bf127ffd94b56b600fffb08738781f84e2f34d0e"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
