class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.207/tierstore-0.3.207-macos-arm64.tar.gz"
      sha256 "5a68c5909fecbc5cfa30374698cca613224e77b1cb532696f2a182844958cf54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.207/tierstore-0.3.207-linux-aarch64.tar.gz"
      sha256 "68cb882458ff16817c4b98f5cc006180fec4e3cd6d307666b58ad6f11060f0bf"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.207/tierstore-0.3.207-linux-x86_64.tar.gz"
      sha256 "c8091045407a82e887deb53fadecff0858aff1104b966ace23795652cd35df2b"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
