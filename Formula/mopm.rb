class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.118/mopm-0.0.118-macos-arm64.tar.gz"
      sha256 "3d5e596f7ffffc2a1d37af2d3b87fe89a412c201013a225a354ba56a74eccc20"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.118/mopm-0.0.118-linux-aarch64.tar.gz"
      sha256 "70d0f5fa62b8c46e94c50c9ed480515cb91ce26f83ce919903c55ed1f101920e"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.118/mopm-0.0.118-linux-x86_64.tar.gz"
      sha256 "758b471a9f1eca7222ffc794f29cbc8ffae75510c1f89231c8e403ccc3b8e2ea"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
