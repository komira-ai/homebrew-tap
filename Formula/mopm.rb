class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.17/mopm-0.0.17-macos-arm64.tar.gz"
      sha256 "e0f9a4d5aca057239f7a137d2bd8de2e6023336b0ae7ab8b0ac48a9c829fe778"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.17/mopm-0.0.17-linux-aarch64.tar.gz"
      sha256 "3ef05d941c034c4407a774cc456a9b641f6ab527e98177cfc3a2572955040cdc"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.17/mopm-0.0.17-linux-x86_64.tar.gz"
      sha256 "dbac6a3802a7c08994b71c5956ca5e10a348343da04cab57d2dd051ba107bcd5"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
