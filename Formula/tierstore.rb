class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.144/tierstore-0.3.144-macos-arm64.tar.gz"
      sha256 "b35512bad11753bfd1ef19c423e48ea9662a6f13e2671b58730ea23fffc6af23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.144/tierstore-0.3.144-linux-aarch64.tar.gz"
      sha256 "3dd277247c4ae47d34f377924d3e8851490f51bcd4b061965dd2d7624540ab18"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.144/tierstore-0.3.144-linux-x86_64.tar.gz"
      sha256 "134f7436e825cecab2a1e71c924f088111ba8c096b5d258f91d0caa4481d6480"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
