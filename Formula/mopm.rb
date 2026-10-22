class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.25/mopm-0.0.25-macos-arm64.tar.gz"
      sha256 "072563ad1cef1d6cb751e4f0060c719a3d5a8470802cf11d64ce28c1e2a0c4ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.25/mopm-0.0.25-linux-aarch64.tar.gz"
      sha256 "fe1a021ab3f9fbd0f5fcb679f00031b2f9f7b38a8dc917abc4cf3cb00b991d82"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.25/mopm-0.0.25-linux-x86_64.tar.gz"
      sha256 "1848ffbb6c3f3522e95c36d3d5f7d4260abb8dde2cb3c415b17ca94dc48edeac"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
