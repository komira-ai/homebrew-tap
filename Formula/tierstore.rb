class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.154/tierstore-0.3.154-macos-arm64.tar.gz"
      sha256 "624bfa5c1deda34db4e942152352a71ccb650a504470abed1294f586cbc83394"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.154/tierstore-0.3.154-linux-aarch64.tar.gz"
      sha256 "ba1e62b79b673e58f517e6b508aeb5add53e34e3ccd023eb3a33bb45282f6795"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.154/tierstore-0.3.154-linux-x86_64.tar.gz"
      sha256 "86ab425829ffebdccd2e572dee2d1df395c249e95bfb758c144b5166a22cdbee"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
