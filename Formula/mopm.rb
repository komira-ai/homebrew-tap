class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.69/mopm-0.0.69-macos-arm64.tar.gz"
      sha256 "7d65d24ddb86583ef10eb5c084dd5a31db7326768b605a1ae19af4555b66c8d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.69/mopm-0.0.69-linux-aarch64.tar.gz"
      sha256 "68dd4f410824bf412d45e2afdfbb473a16b57500effbb3b0618da0a75dd26382"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.69/mopm-0.0.69-linux-x86_64.tar.gz"
      sha256 "226f742424958269e6ee33578516ea400dbf87ca3e85f0854ecaef757c7cb943"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
