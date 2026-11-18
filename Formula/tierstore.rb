class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.128/tierstore-0.3.128-macos-arm64.tar.gz"
      sha256 "161094f388404f77b09d3c70bb6415467b4c5ea208540bed228039144c919442"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.128/tierstore-0.3.128-linux-aarch64.tar.gz"
      sha256 "e987bc4fa01ec3bd0ae81d0ca9f27b5e20695ffc4bf29a6790f0b0cf5441ef51"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.128/tierstore-0.3.128-linux-x86_64.tar.gz"
      sha256 "475bdd44cdd480500b98458f5d57d1c768b7754651d34272ebea32f2c174fb2d"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
