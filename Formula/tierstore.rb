class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.122/tierstore-0.3.122-macos-arm64.tar.gz"
      sha256 "824152b2fb7f4433cf0d28f982392a1be2c29bfce87b223af2ae2a7e311d2773"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.122/tierstore-0.3.122-linux-aarch64.tar.gz"
      sha256 "2d5b6589c607b2a5ffaf79d0bd17de5a118c12f1b99d4a0c40abfc11542a0ad7"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.122/tierstore-0.3.122-linux-x86_64.tar.gz"
      sha256 "08ddf2eddf5489b596b4492e5f60e89c403986a1d3331d9801ff57bfb0c771a8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
