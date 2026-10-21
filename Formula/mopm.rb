class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.12/mopm-0.0.12-macos-arm64.tar.gz"
      sha256 "430be6359498281a9900fc8cdc1429415710666c80cab6c37a75400f5515c61b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.12/mopm-0.0.12-linux-aarch64.tar.gz"
      sha256 "e9253816bd0bd17fada204952ca17bc8c938b2688be9a9b6baa2110a39c6ae27"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.12/mopm-0.0.12-linux-x86_64.tar.gz"
      sha256 "0b318ae16b65451b09b9aee47d36ba26c1c76076b74f751799693d810c1a29b0"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
