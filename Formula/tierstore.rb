class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.87/tierstore-0.3.87-macos-arm64.tar.gz"
      sha256 "557f147d695b391dd7ee3a01fcddea4e660abe1e8f806d7e54c34fe755ef01d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.87/tierstore-0.3.87-linux-aarch64.tar.gz"
      sha256 "bfbdfb2d5cef103f0d4fc3f2618c8913b6dc4fdea58fd3a9396754a66d72d0f4"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.87/tierstore-0.3.87-linux-x86_64.tar.gz"
      sha256 "f7b77fcd247d0e80381b145d4f2bbc0930888b1501fbaebfcca0cf92afaca587"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
