class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.194/tierstore-0.3.194-macos-arm64.tar.gz"
      sha256 "27ac94e76f318b15912c5e386d0729bb0f89c7bca0ab63067bf3e04a11e02e57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.194/tierstore-0.3.194-linux-aarch64.tar.gz"
      sha256 "d71757dd5ff58ff2600b0eaad2169eda19f57d3c8d6649b681fdd83eac30096a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.194/tierstore-0.3.194-linux-x86_64.tar.gz"
      sha256 "4341348aeb6f0d77aae2b402cd420b4f5c9c9d45e3fe40fd2f9feba494c15df8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
