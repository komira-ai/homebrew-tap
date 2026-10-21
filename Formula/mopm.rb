class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.14/mopm-0.0.14-macos-arm64.tar.gz"
      sha256 "a9c5b9dcb84585c2845bbdb230c50f3401be7e4d6f74a78a2d61a2ddb83997fa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.14/mopm-0.0.14-linux-aarch64.tar.gz"
      sha256 "d9c02216354681be50783f4d065440acb6b058f9b161e4b4af04ac05d2d0344c"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.14/mopm-0.0.14-linux-x86_64.tar.gz"
      sha256 "8827664231368fafeb49511104a02fb789ec50a1a157f3837cc67a796e2e48b2"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
