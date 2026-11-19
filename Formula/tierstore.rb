class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.137/tierstore-0.3.137-macos-arm64.tar.gz"
      sha256 "184592f8160b5b25598cccbc3af58578c981054871392a12c70f2c60fb4cd9f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.137/tierstore-0.3.137-linux-aarch64.tar.gz"
      sha256 "e87902a029d54ed24144827392ff84302781aacc4e5d3c574d6deeaeb74c0f47"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.137/tierstore-0.3.137-linux-x86_64.tar.gz"
      sha256 "c56df46dc9de6387f7c4b87318a878190c4f115e69018d1f2b55e35567260e99"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
