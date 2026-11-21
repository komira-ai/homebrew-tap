class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.152/tierstore-0.3.152-macos-arm64.tar.gz"
      sha256 "f228b631aa079d03df9bddc091ee0390b71a2dbd406f63483845a61c66b79973"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.152/tierstore-0.3.152-linux-aarch64.tar.gz"
      sha256 "cf87c6cdb4807f287b2f8fa73ded772cff2a3580549a66ee3b16a512cec5e1c7"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.152/tierstore-0.3.152-linux-x86_64.tar.gz"
      sha256 "d66978b6ab35e34ee8a99a70b06e92fe1440efee2d417caf0e8bb38b1a6bde4b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
