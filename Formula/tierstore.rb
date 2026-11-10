class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.86/tierstore-0.3.86-macos-arm64.tar.gz"
      sha256 "729424fcb9ce13d41a6538f6ad6937313d61f1651d60ef0d67969cd0031a76aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.86/tierstore-0.3.86-linux-aarch64.tar.gz"
      sha256 "0640dd1fca0a5c6fd53828991b87ccdf967ac0df5dafcf8f5e9296ed841b7ddb"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.86/tierstore-0.3.86-linux-x86_64.tar.gz"
      sha256 "38ceba1ef42f3a3b421082d224efc358f47fbe117ec00261b1fdb8bd23b67391"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
