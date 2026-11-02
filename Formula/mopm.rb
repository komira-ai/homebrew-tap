class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.104/mopm-0.0.104-macos-arm64.tar.gz"
      sha256 "30f41a74a8cc9806f34f4f525e77397946fb2cc9682440581ce0b37ea205720f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.104/mopm-0.0.104-linux-aarch64.tar.gz"
      sha256 "7e3a0aec13fad9ec8d58fcaa6e3d8ec7efa5a520fd3dde08608d2e09bd0b52d6"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.104/mopm-0.0.104-linux-x86_64.tar.gz"
      sha256 "f7981334c4bb36e90def4d86219cc9686c9435d958def474fb2c13ede78003de"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
