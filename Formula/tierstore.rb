class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.188/tierstore-0.3.188-macos-arm64.tar.gz"
      sha256 "dce0a6e0c01208e5cb6229f61351238d0473acb79b3e73d82a30a9b64c6007b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.188/tierstore-0.3.188-linux-aarch64.tar.gz"
      sha256 "290ad4fce912c1aaddf9e9e4930ef1697b015522e4b92ab71465a8e7bbb98a55"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.188/tierstore-0.3.188-linux-x86_64.tar.gz"
      sha256 "bc6aaf4275542b73178af501f3aaa0a02c2826b7fb7bf7f483cda2d5571c6541"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
