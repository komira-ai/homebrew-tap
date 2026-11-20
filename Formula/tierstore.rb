class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.148/tierstore-0.3.148-macos-arm64.tar.gz"
      sha256 "1a9690a95fd2767304f8cae5d2c3c9d23836922412c6798aa92b5a995b77bfa2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.148/tierstore-0.3.148-linux-aarch64.tar.gz"
      sha256 "e3e2106f4056ac1a39c468434630624998d1c325b9a028d4161e48b817fa3a30"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.148/tierstore-0.3.148-linux-x86_64.tar.gz"
      sha256 "19835a2d54f12f1b94f9a29502d94e66b856ed206c48b09d1d7e2ddc857a9141"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
