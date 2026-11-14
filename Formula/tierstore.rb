class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.106/tierstore-0.3.106-macos-arm64.tar.gz"
      sha256 "db05a059fe1ff29f29feda9b4b595dea47586750d210ce915a62d80bb2990ae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.106/tierstore-0.3.106-linux-aarch64.tar.gz"
      sha256 "024372cd57347c81b29521b942fb0726e0942c9667f49dfa65cc2aa0bc05353f"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.106/tierstore-0.3.106-linux-x86_64.tar.gz"
      sha256 "053602fa521993434c96c5f317f431bad509894090561d6927511183b20dd3a4"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
