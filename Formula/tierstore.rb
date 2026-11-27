class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.195/tierstore-0.3.195-macos-arm64.tar.gz"
      sha256 "278445c7446a77d5a0c6dbc1ff444b326d4bae7b14d73b9bdc4bebec21e81fcb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.195/tierstore-0.3.195-linux-aarch64.tar.gz"
      sha256 "666d7bff50eadb2e287f628b5745bfc33a9fa1bbdc9df1d834a2f161b459c164"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.195/tierstore-0.3.195-linux-x86_64.tar.gz"
      sha256 "203fc08d235c5b2cd4e1c7eb9102c8480e1ae115b74359a223eba6b2126ab33d"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
