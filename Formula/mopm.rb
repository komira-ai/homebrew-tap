class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.128/mopm-0.0.128-macos-arm64.tar.gz"
      sha256 "2b08f3ad04d8a79dab395f57db6bf73cd4348668b8f554a433a63f23cfe57272"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.128/mopm-0.0.128-linux-aarch64.tar.gz"
      sha256 "fd9b6d402b0474ccfcd42d5dfbfe7317c1663e3787d3685397b2a0f1ed3a9062"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.128/mopm-0.0.128-linux-x86_64.tar.gz"
      sha256 "96af5c73f43518fe8629f9f9a0d88a06bea99cda1b9405f4e01b453b9f91afb8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
