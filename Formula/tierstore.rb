class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.92/tierstore-0.3.92-macos-arm64.tar.gz"
      sha256 "90e310394ad39941f38b86f3dba6f66d38e509e361b3e6287ebe5f41f2ecd53c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.92/tierstore-0.3.92-linux-aarch64.tar.gz"
      sha256 "24ba1a7ddf7eaf24466f8d76278e4b2a8be1964bec18137e30432e7ea8f496a4"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.92/tierstore-0.3.92-linux-x86_64.tar.gz"
      sha256 "86138838de6e71bebfd17392bf8354e0b0fe212e6d3f2098066815ea09583217"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
