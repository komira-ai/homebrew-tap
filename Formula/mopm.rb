class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.134/mopm-0.0.134-macos-arm64.tar.gz"
      sha256 "7b807d92da8783cfb3878971729c050813c14e140e52f0a390f23cca8c747a73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.134/mopm-0.0.134-linux-aarch64.tar.gz"
      sha256 "954924c1c859afc49728c7feeb07cb692978d99063a87b17bef5eca37fd0bca8"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.134/mopm-0.0.134-linux-x86_64.tar.gz"
      sha256 "8ce5c811c4f8ad0d7d24f8bc7bd236f2db2ed3c1f7c74f9c05e45bde20bb81d5"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
