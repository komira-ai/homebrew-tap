class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.49/mopm-0.0.49-macos-arm64.tar.gz"
      sha256 "822c9e2711ea9af6d218b3e4fc424dda8ddfeb1560e709f39375bafdae9daeef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.49/mopm-0.0.49-linux-aarch64.tar.gz"
      sha256 "a87ec1230086732465fa7e8ea3565f762385556f22666e4e6c2d7ab0f55a4c2c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.49/mopm-0.0.49-linux-x86_64.tar.gz"
      sha256 "6a4c4dbcca83db843d8089343d4fa5832688eb3965a09dff7556a3320d50cfb3"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
