class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.107/tierstore-0.3.107-macos-arm64.tar.gz"
      sha256 "644994221470fc3b71bb779e4fb3bb8f5ce7a0939ac10f4eb3d566403e21c422"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.107/tierstore-0.3.107-linux-aarch64.tar.gz"
      sha256 "7c1c484124a3eb4c415a28c52a0185f6261f9371c00a8f1b241b99c84f061df6"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.107/tierstore-0.3.107-linux-x86_64.tar.gz"
      sha256 "372259920803f7b0024363a0a08746ad4809c03f86890f31705ec5e293a86ba9"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
