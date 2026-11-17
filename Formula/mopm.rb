class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.114/mopm-0.0.114-macos-arm64.tar.gz"
      sha256 "793f436c2c6a7df4589c71a62c012418a4d480f727eb9f9d1bbaa574d36ed7ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.114/mopm-0.0.114-linux-aarch64.tar.gz"
      sha256 "28937f9fdde1ee847d95f69af73d2ae5460873749c2b72c0226ae2f64b6b4ab0"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.114/mopm-0.0.114-linux-x86_64.tar.gz"
      sha256 "3c4d144ae83936078721ebc7181ad97fd43a630c66ca1874f2b5deeaf36e34a8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
