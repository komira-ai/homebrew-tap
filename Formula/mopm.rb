class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.29/mopm-0.0.29-macos-arm64.tar.gz"
      sha256 "d2e538a1f5d0577795cb67011af9850451bcb0bb71eebc1d3bc703ee03ccd337"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.29/mopm-0.0.29-linux-aarch64.tar.gz"
      sha256 "7329c0b00c23e5183959751faed765a2429dc2a82a1f41f030eea167261becfd"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.29/mopm-0.0.29-linux-x86_64.tar.gz"
      sha256 "74a20999727dd2d60e38e10ffa3c87522055c2de5e248aa89c252cac3ce7c82b"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
