class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.104/tierstore-0.3.104-macos-arm64.tar.gz"
      sha256 "fdda06067f3b4ccba83f681d2118868d3f6c57629f76efef5f2b62d0bdcef4d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.104/tierstore-0.3.104-linux-aarch64.tar.gz"
      sha256 "3757df000707e610c86a7117bf9c18b5044f3e48a26a4eb89cfb460106d8cc47"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.104/tierstore-0.3.104-linux-x86_64.tar.gz"
      sha256 "88e513f93677af18d0f0d9754cde0e93776b549cae861d00d424706eaf5e578c"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
