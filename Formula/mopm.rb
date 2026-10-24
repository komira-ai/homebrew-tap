class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.39/mopm-0.0.39-macos-arm64.tar.gz"
      sha256 "94ad76246a16f2306db76425d40e4f4e59f2b1d48b060942e75dd7e2596ea3d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.39/mopm-0.0.39-linux-aarch64.tar.gz"
      sha256 "8f8bef7fa47e04303661d16d4c582cb5dafc23e667e9102ad71f2fc6b7b56b13"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.39/mopm-0.0.39-linux-x86_64.tar.gz"
      sha256 "962cb92e19fa1edfe24c031aad13ee30591c9b95967522ebc1b9ec008f27a133"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
