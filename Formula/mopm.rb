class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.16/mopm-0.0.16-macos-arm64.tar.gz"
      sha256 "28cc48d398343ffef3cf4e3e8939dd9085bc1b76bba21fc36fe55e51f0e67ec9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.16/mopm-0.0.16-linux-aarch64.tar.gz"
      sha256 "e17c27a485cbdf12a02591399745ddf3da38ab761774fbd4e011f5d7ebcea66e"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.16/mopm-0.0.16-linux-x86_64.tar.gz"
      sha256 "5bf635dc71589401230e8256b895c6b6875dbfe2add6b66cbbf26c67868f9500"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
