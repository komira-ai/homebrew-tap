class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.121/tierstore-0.3.121-macos-arm64.tar.gz"
      sha256 "72e00a9f9006deb874031acd995bc7196ec8e983c06bb865583b676cbe296610"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.121/tierstore-0.3.121-linux-aarch64.tar.gz"
      sha256 "76464e316b583b94e82d60f76cec828702ef89041e63713355b35d63cf98fdec"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.121/tierstore-0.3.121-linux-x86_64.tar.gz"
      sha256 "c076ec2c268aeba4971d5e64b3e977639f59456de7930f25e575d51b5592cef0"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
