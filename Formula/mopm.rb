class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.28/mopm-0.0.28-macos-arm64.tar.gz"
      sha256 "988534db7713c36ee5a2a292cd86ff8543c491cf3590ea00e2aacdd0030adebc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.28/mopm-0.0.28-linux-aarch64.tar.gz"
      sha256 "a7fee5db3b347c2e9a5d335291c10a78bd9ddfeae116a0c3172feb2c9cb6ab15"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.28/mopm-0.0.28-linux-x86_64.tar.gz"
      sha256 "9db74e126b471b9645848c5e9c839a0051ee45246c3afc667d86d5ac80c1f791"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
