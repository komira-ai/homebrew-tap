class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.181/tierstore-0.3.181-macos-arm64.tar.gz"
      sha256 "c2517bce027a0e3ea962beb7c29547a38ef9ace1f82b6a009d52c09fa4299ad6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.181/tierstore-0.3.181-linux-aarch64.tar.gz"
      sha256 "713062309baf549ff1af315a3bc3e3e39eb6714fe18c8ab08e09d9cd000e73d5"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.181/tierstore-0.3.181-linux-x86_64.tar.gz"
      sha256 "14cc45af4c9a8148c2ace4215c244e7378a7fe9916ce8c3f629f8a898a96e07a"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
