class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.163/tierstore-0.3.163-macos-arm64.tar.gz"
      sha256 "893186f67fe12610de9e6f94af5bd896e6861ab7363a9dd48513194538db0012"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.163/tierstore-0.3.163-linux-aarch64.tar.gz"
      sha256 "3df6aefbfd2a23f106d8df81c1ceae589379a06c3acb02636e563b0e5d50db0a"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.163/tierstore-0.3.163-linux-x86_64.tar.gz"
      sha256 "722a8387d9f6bc0801368d4b5de7d8f98266323335b37f0f5e75bcc213c1231c"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
