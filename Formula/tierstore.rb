class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.114/tierstore-0.3.114-macos-arm64.tar.gz"
      sha256 "3691783a2ef016e2c4d74097eff4ef6444f96c6533d1ff374c53f60caa95099f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.114/tierstore-0.3.114-linux-aarch64.tar.gz"
      sha256 "3d658a05ae5fd211f1b815511a23001097a56e965c2cee84a5a9e7372bcd14c6"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.114/tierstore-0.3.114-linux-x86_64.tar.gz"
      sha256 "ae6e8f0d1688b8b9ba763bb5bae227ca077c3ce9d8ba0a9c33894504a3577755"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
