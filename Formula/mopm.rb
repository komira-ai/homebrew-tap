class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.111/mopm-0.0.111-macos-arm64.tar.gz"
      sha256 "6f66abfc9b9bd1a749b26102132552ecaac6bb672af0914e57c0281d01b9f0c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.111/mopm-0.0.111-linux-aarch64.tar.gz"
      sha256 "2da93384e8915c293cec3e60dac6a2e8c389512f9994d28850f3b0258a8cff12"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.111/mopm-0.0.111-linux-x86_64.tar.gz"
      sha256 "52b60c1661b2e1a80e9d70018bbdf7e3f9a479b30a8250bda561067c696c36f8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
