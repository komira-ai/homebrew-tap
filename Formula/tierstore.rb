class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.141/tierstore-0.3.141-macos-arm64.tar.gz"
      sha256 "aed7015397ff60f60b2c5747e35fb65041a2c79e8f3e5b83d7db85dd44b153c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.141/tierstore-0.3.141-linux-aarch64.tar.gz"
      sha256 "35b37b0353faa9ca696f041f46f1b931bc4ff75fb78975325131d21e38b41114"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.141/tierstore-0.3.141-linux-x86_64.tar.gz"
      sha256 "bc9cecf166275d2161e0aebe4ea07a9f7836603ab61681de10a1d07eb6017a7f"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
