class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.88/mopm-0.0.88-macos-arm64.tar.gz"
      sha256 "cccb629663a613a62a54cabde6171318aec9c66f350a9784aa661204ef9032e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.88/mopm-0.0.88-linux-aarch64.tar.gz"
      sha256 "38829aae54953af8b3823f330d32bedf76be1c00c24779cfeae594f1271b1ba1"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.88/mopm-0.0.88-linux-x86_64.tar.gz"
      sha256 "703beecb6b2870a1bedf1397c29591c1d7e1320b9479eb1fa4aba3e1d4aa6a00"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
