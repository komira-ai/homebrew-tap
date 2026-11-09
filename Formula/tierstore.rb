class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.79/tierstore-0.3.79-macos-arm64.tar.gz"
      sha256 "1e671885704b43450ca9f7e03df52fe6cf10ebcb3c3419c2aca80e02ee1e0e55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.79/tierstore-0.3.79-linux-aarch64.tar.gz"
      sha256 "f20b709bfb0655d3b0cbe3da61e6f6ba1dd514f50c5c05f855bda7547f7e63c8"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.79/tierstore-0.3.79-linux-x86_64.tar.gz"
      sha256 "71bd073c12fbc398f6c2464693b295da1b1ef7189fc3ce25e4a5d09eae737585"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
