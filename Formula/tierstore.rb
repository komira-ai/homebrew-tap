class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.98/tierstore-0.3.98-macos-arm64.tar.gz"
      sha256 "619a6c734e333981a44958f4b808778b0eaecae8e912c50da1082565d7c3e757"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.98/tierstore-0.3.98-linux-aarch64.tar.gz"
      sha256 "3e9ed0dd65ea5dfef445be2f7aa97391265af1be8f3d0a5917cb7b422184dd11"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.98/tierstore-0.3.98-linux-x86_64.tar.gz"
      sha256 "5594f47cfbbb919c44c54e32ee5b1aa3317875a6952db9e23b1f4fcadc2acdd1"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
