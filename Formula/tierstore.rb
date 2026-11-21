class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.153/tierstore-0.3.153-macos-arm64.tar.gz"
      sha256 "10cebee6b82b704674df2fe7a0fb1433ab84abee541abdb5ec28007efdb3042d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.153/tierstore-0.3.153-linux-aarch64.tar.gz"
      sha256 "f99150b2bc64601683a3c04f67cba9eb51c032eab637db97027dda13162076dd"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.153/tierstore-0.3.153-linux-x86_64.tar.gz"
      sha256 "39f3fb618c506a42cb8bdb8545674574cb45a7d93db18c121edffee6f3214808"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
