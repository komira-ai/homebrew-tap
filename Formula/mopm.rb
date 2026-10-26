class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.70/mopm-0.0.70-macos-arm64.tar.gz"
      sha256 "972f8d1a222175b0b60d7988c33aede4deb9df1b218b68076ad4052c5b5d991e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.70/mopm-0.0.70-linux-aarch64.tar.gz"
      sha256 "9c1d26fb21d93effd4cf3dabd10bc435dfe07d787cf1d5099edc6146d64f60d3"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.70/mopm-0.0.70-linux-x86_64.tar.gz"
      sha256 "a0a711ba0c9af98d8537150c6ac87e3b0deb061980cd61b8f47107c1488fa2a6"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
