class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.138/mopm-0.0.138-macos-arm64.tar.gz"
      sha256 "be374a975d91316cea2a18eab545c80aa96b46cd5934f3e0ce14e31630939605"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.138/mopm-0.0.138-linux-aarch64.tar.gz"
      sha256 "b28c3d9eff71309b2da075b5b8c8ddcd6fb5f9c33d822f0a42a1a06a6ae6b1b8"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.138/mopm-0.0.138-linux-x86_64.tar.gz"
      sha256 "e9f6de55c1754d3692d27127bbe465325af5227a21fd9ad2321a3f72dba124a1"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
