class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.141/mopm-0.0.141-macos-arm64.tar.gz"
      sha256 "7983a4832d6f36310e60cb67af04ff682ea10695886c53e2d238f64e6aab5af7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.141/mopm-0.0.141-linux-aarch64.tar.gz"
      sha256 "e4d7ef3065b8a6c6bd8184725c1610a4b269efa4935de795a094dc987e52c294"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.141/mopm-0.0.141-linux-x86_64.tar.gz"
      sha256 "790d8a02c798e7ebac33aed91b21ba16ae35202f6c4452ebf6fd6d2bee4a90a8"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
