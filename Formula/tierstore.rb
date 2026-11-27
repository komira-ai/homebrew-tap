class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.209/tierstore-0.3.209-macos-arm64.tar.gz"
      sha256 "604a382dc56eff8cfd5636778669be7437658e39945ba22ea27c68e5e64bd2c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.209/tierstore-0.3.209-linux-aarch64.tar.gz"
      sha256 "8e8701d69122b4b53489903b8f2a1b435a2883eba9c0a9cadc60c1fe907a0bab"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.209/tierstore-0.3.209-linux-x86_64.tar.gz"
      sha256 "c3cdb8692eb148090fb3b0db844adbda7b8f7d6d07e4b9480b92cb9a351b2481"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
