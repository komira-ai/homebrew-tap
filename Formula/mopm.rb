class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.142/mopm-0.0.142-macos-arm64.tar.gz"
      sha256 "c6ddcb64f5e0b99f8ae7d595dbf7dce3514f240e473c89aad880d5e25c347d17"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.142/mopm-0.0.142-linux-aarch64.tar.gz"
      sha256 "b7e0af9eaa4e0dcdc4774745065d5e3dbaf6fdc7ec4f07931622f3bc4c60a851"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.142/mopm-0.0.142-linux-x86_64.tar.gz"
      sha256 "faedd1bba9acc69f9e2f58bf05500ff9c1c58866c484c85dd84ef562b2fcad42"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
