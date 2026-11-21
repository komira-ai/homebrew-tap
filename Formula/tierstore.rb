class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.156/tierstore-0.3.156-macos-arm64.tar.gz"
      sha256 "33c13ac8b3075f54a520248fecb5bbf28ce653e139626583c1420d5eb9cf50d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.156/tierstore-0.3.156-linux-aarch64.tar.gz"
      sha256 "879c8d0897d3e9766cf44887f8bfad2b04065e9085e3a5b819e755c0ac077f95"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.156/tierstore-0.3.156-linux-x86_64.tar.gz"
      sha256 "adc89cb4e9adc8fd8e9849a8a43279da3b2c47566c8ce01ee9fc600079e91455"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
