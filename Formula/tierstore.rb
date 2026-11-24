class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.180/tierstore-0.3.180-macos-arm64.tar.gz"
      sha256 "fd0ecc87e605c15456b5a821bbc76b9152fc1efcb74e3a0109b9e11b910d6628"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.180/tierstore-0.3.180-linux-aarch64.tar.gz"
      sha256 "6845bf7546936fbf6714d329d6f3b6a7e735cc7c82687baade4e762f4519e159"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.180/tierstore-0.3.180-linux-x86_64.tar.gz"
      sha256 "2f6d2e9f870fb492932325ce1ffa6ff8c6309562d222abec26ae2796f1aa8e9b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
