class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.165/tierstore-0.3.165-macos-arm64.tar.gz"
      sha256 "b7567818b3ee23b4cb803753591fe672f4c62f394adbea071405a4acc1d5122c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.165/tierstore-0.3.165-linux-aarch64.tar.gz"
      sha256 "b7598adce546cd0219db626e417b7e33def2f5715907ebc97e8865846c94a592"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.165/tierstore-0.3.165-linux-x86_64.tar.gz"
      sha256 "a9a7ed5084d96d079bb2dd31c2ecb3ec4ebaad65ebaa72b4ab58632f34323dcd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
