class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.52/mopm-0.0.52-macos-arm64.tar.gz"
      sha256 "e8d44bc9439d31ccbf27850ec5302d2ff785b24227378fcf0a7e0910bba37dda"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.52/mopm-0.0.52-linux-aarch64.tar.gz"
      sha256 "d07524d10e98fbbdb5ed88620d65e8eac8468aab27122cd642533fb05a37f47d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.52/mopm-0.0.52-linux-x86_64.tar.gz"
      sha256 "1de06257b58fb36ceeca8d4977867a6fec65f87655426a2eb86d59f464894fe5"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
