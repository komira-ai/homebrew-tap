class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.86/mopm-0.0.86-macos-arm64.tar.gz"
      sha256 "ea2e27a787a54c9ce5c4aff652276828a45f98ab568ffd9f5dd9278294ce9a08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.86/mopm-0.0.86-linux-aarch64.tar.gz"
      sha256 "8e111516508f9fb599e4c78167c353bf4cb5c3bbff0aaf045b6504aa69e005f1"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.86/mopm-0.0.86-linux-x86_64.tar.gz"
      sha256 "7386a1aadb704fb38e8cf6c0e5defc90cc5c5aed49f089633f4f18b8a5065792"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
