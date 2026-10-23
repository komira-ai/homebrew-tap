class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.32/mopm-0.0.32-macos-arm64.tar.gz"
      sha256 "5e4dada6a37ab3e4b5748b98562d92749d7d0fc0ad3c1e3dca5b83e7238a484d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.32/mopm-0.0.32-linux-aarch64.tar.gz"
      sha256 "37f48f904220a97c4c669c4967959e140b16b1612ad9be92b99d8ab98f5c752b"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.32/mopm-0.0.32-linux-x86_64.tar.gz"
      sha256 "7b39c9ca3cd3db27d50391cb0f470c872c97deb103d27c2810bf0621c48750c1"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
