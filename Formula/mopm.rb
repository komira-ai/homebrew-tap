class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.65/mopm-0.0.65-macos-arm64.tar.gz"
      sha256 "b31071162dd756908fce223e83c3726852d0c42a29431ef43b568bdc62602778"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.65/mopm-0.0.65-linux-aarch64.tar.gz"
      sha256 "c2e09f91ef97d4116c4420091a761794a246214c9b82b5175d0f78a7fafa8102"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.65/mopm-0.0.65-linux-x86_64.tar.gz"
      sha256 "2175bc8a84feebeee52f5328ea96c8a0b0dfbcd4ef8c63d867513d2d8365b96f"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
