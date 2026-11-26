class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.190/tierstore-0.3.190-macos-arm64.tar.gz"
      sha256 "cbe7a7714fea5bd3399cfe903cf8cf9cec6787b8436950115fc238fff1b494d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.190/tierstore-0.3.190-linux-aarch64.tar.gz"
      sha256 "ec7307c9942ca3079a2547e30d863247b454f9d81592ae6db1b053bb7c6ea8ec"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.190/tierstore-0.3.190-linux-x86_64.tar.gz"
      sha256 "00d54e04f4bb5c7bed46619c6e9dce6df1916adbcba3ceee434ab6fc8515c294"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
