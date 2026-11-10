class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.88/tierstore-0.3.88-macos-arm64.tar.gz"
      sha256 "914067ab4b89b4af271d88fb8629292357165cb629f768d57c6bfd704c2907e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.88/tierstore-0.3.88-linux-aarch64.tar.gz"
      sha256 "4a13368e816f62fbc1046724aaf72d6a95f8e2b5c4036245de9b8b4ededcec97"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.88/tierstore-0.3.88-linux-x86_64.tar.gz"
      sha256 "0792286f51ad52e070f5185458be43c5f1b7f1a49427a49e1173a8b3420c9307"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
