class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.103/mopm-0.0.103-macos-arm64.tar.gz"
      sha256 "3d1e0417651477c82095c698b307e2eda0c62b3013f82214d761ea47bb5606e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.103/mopm-0.0.103-linux-aarch64.tar.gz"
      sha256 "27b4d8f056be76777aea006a195e71a514a0442e4be4c9b3e51c3a9296f061ba"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.103/mopm-0.0.103-linux-x86_64.tar.gz"
      sha256 "57602dddc529e7f5525d6408c0441a1c82f915566a3ed9a6ee5973155eeca5eb"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
