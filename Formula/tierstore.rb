class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.125/tierstore-0.3.125-macos-arm64.tar.gz"
      sha256 "beb335ba37f25b7b10cde15f07b02be7add0d15395d0b752650a1b021c987dc4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.125/tierstore-0.3.125-linux-aarch64.tar.gz"
      sha256 "807b639a27e12c6d2d0f0e0f4b3378d7c8d6497cbc74780ae046209b78a23d33"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.125/tierstore-0.3.125-linux-x86_64.tar.gz"
      sha256 "1aeccb48e0b7cdbefc3bf9466b06ae913dc48519acc5e593017eeb45452649da"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
