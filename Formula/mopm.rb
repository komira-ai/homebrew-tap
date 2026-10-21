class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.15/mopm-0.0.15-macos-arm64.tar.gz"
      sha256 "3041032acc112af72f5d18a9c461792e38947a704f5376346aa438001b838289"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.15/mopm-0.0.15-linux-aarch64.tar.gz"
      sha256 "f41c1be1ff87a6329fb9d921d41ed9688444326596937a3c45a3cdc6b6b8826f"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.15/mopm-0.0.15-linux-x86_64.tar.gz"
      sha256 "5f021430b118cc217124ebb2dd43146614204a1835730b2597d4bbdff1d62b50"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
