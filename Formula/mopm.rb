class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.109/mopm-0.0.109-macos-arm64.tar.gz"
      sha256 "c7cf89287e435792ed643c2a22e8c0d64fe89fab6b36103a9c6cee24f548a775"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.109/mopm-0.0.109-linux-aarch64.tar.gz"
      sha256 "f30cb4b3e91002550aa620b7fb43293c64af049c314f2c5ad0e6b9827152dc63"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.109/mopm-0.0.109-linux-x86_64.tar.gz"
      sha256 "18c46e58f7d6fa8c2e659eb34e155bf97c6aa616be538d403fdf5e597b888811"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
