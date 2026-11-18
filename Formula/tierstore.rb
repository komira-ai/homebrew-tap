class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.134/tierstore-0.3.134-macos-arm64.tar.gz"
      sha256 "f6348f72c9aa4bc7938d6df965a9afa834b1373a255398d753c3b4c262e86be6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.134/tierstore-0.3.134-linux-aarch64.tar.gz"
      sha256 "317c00e26a0fdc578b69c299ad83a249e570de125336b40361629d598ebe50c4"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.134/tierstore-0.3.134-linux-x86_64.tar.gz"
      sha256 "f6029e89b6fd9112d0c597a73731bbe05362e8bbd682f2a69509f6c986719577"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
