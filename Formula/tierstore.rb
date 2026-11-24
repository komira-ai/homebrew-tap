class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.179/tierstore-0.3.179-macos-arm64.tar.gz"
      sha256 "e17b1f59bf9d86ea123337a09da3c88d12e1ea3b91c4266d6672e05f078f3cf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.179/tierstore-0.3.179-linux-aarch64.tar.gz"
      sha256 "86cb6168d954ec765e7ff0b19ed9325791f72e8c68c20f9828c46bdca9429474"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.179/tierstore-0.3.179-linux-x86_64.tar.gz"
      sha256 "9e6c93dd2dd0edd964c050ea65db69520d2db9ee34b3490460ddfc1775c4df9e"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
