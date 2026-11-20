class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.123/mopm-0.0.123-macos-arm64.tar.gz"
      sha256 "02c45ce8b8fc6c7a12cc5c8a51b756e32855fd305ab3cf95eb873fe966ef9b6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.123/mopm-0.0.123-linux-aarch64.tar.gz"
      sha256 "9037422f979132731c618ab5db626fc98a1f6d05c3606b486f03c0616a7e19e5"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.123/mopm-0.0.123-linux-x86_64.tar.gz"
      sha256 "743e06e46164e8552b3e5575bcc27b2c20a3abeb41fa4807a31171b1ebc5ab02"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
