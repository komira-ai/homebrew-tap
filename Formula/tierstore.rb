class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.150/tierstore-0.3.150-macos-arm64.tar.gz"
      sha256 "1091e509f568170896cf20f4c14c251cd43fd29814ac5a71485d5e44bcfc83e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.150/tierstore-0.3.150-linux-aarch64.tar.gz"
      sha256 "d8bf5d71e942f43926d62989952c5c65edae270cc64af7e0cb7950abc2e9adc5"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.150/tierstore-0.3.150-linux-x86_64.tar.gz"
      sha256 "92fc235f26d689736dc6b85be60f45b60b699605f471109e7f414499c0bfa1fa"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
