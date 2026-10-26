class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.61/mopm-0.0.61-macos-arm64.tar.gz"
      sha256 "b6b8d6bc04c4a837dfd1b267f4dfdce6c6bce2c9be8da3d0e00d6a0254f8bdc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.61/mopm-0.0.61-linux-aarch64.tar.gz"
      sha256 "6428ad83868f3e3ddbffc66891ec45eb2c99c91baa09157a17ccb35d92591e04"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.61/mopm-0.0.61-linux-x86_64.tar.gz"
      sha256 "bd261f2a532f19b5acddeac1d4f5752a40698a2a4a83721d2d3f938da0600819"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
