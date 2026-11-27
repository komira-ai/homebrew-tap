class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.203/tierstore-0.3.203-macos-arm64.tar.gz"
      sha256 "2aa026f7b5d2d63945328b7cff060331e01154ff6d855c27887048e8718bbec2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.203/tierstore-0.3.203-linux-aarch64.tar.gz"
      sha256 "9f6ab8074e88f6227b635b5ddc23252a1bd4d6e5d2ead0258ced1fda94ac1a62"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.203/tierstore-0.3.203-linux-x86_64.tar.gz"
      sha256 "d4afbe7073e0dc30ebfd07dbdba31654776e023467da6e194372fbc063434ab8"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
