class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.97/tierstore-0.3.97-macos-arm64.tar.gz"
      sha256 "413b5e90094205994ca12d284fdb20a1b2be9bf6c3322181b549d9784970356c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.97/tierstore-0.3.97-linux-aarch64.tar.gz"
      sha256 "425bc0f40b4b08ae8c5676eacefea05a692cecb4821a8036498d8ca4181405ba"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.97/tierstore-0.3.97-linux-x86_64.tar.gz"
      sha256 "edd70adb192d1e3d2e89e1a94f13d2c8d37bd160e3d7c947df6c9b2ab10a280d"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
