class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.127/tierstore-0.3.127-macos-arm64.tar.gz"
      sha256 "e9aa913b61a2a6dd6178c13693aa8c2693430e561d5b3b6f0c170f70902eabb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.127/tierstore-0.3.127-linux-aarch64.tar.gz"
      sha256 "b14c0c19c41c67ac5f3ca53a1b15cd57a587a0ee4030431808caf9e3aa32bba8"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.127/tierstore-0.3.127-linux-x86_64.tar.gz"
      sha256 "868734e188f6439f5801fe3bf3205d4d582c384ac4450c3706a57cb3dc312e26"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
