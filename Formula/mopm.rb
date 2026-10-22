class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.27/mopm-0.0.27-macos-arm64.tar.gz"
      sha256 "e2918655c5c9c8dd079b7d7593c6efefb69cbbe4a315b403c3d8165d1a0a55f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.27/mopm-0.0.27-linux-aarch64.tar.gz"
      sha256 "83fcc29365ca5c3feae8b8304147a9aa7239e6b5505c6ee056c9e621ca85b8a7"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.27/mopm-0.0.27-linux-x86_64.tar.gz"
      sha256 "c07f0fe5fee45986c2aeb8273cb2f32cbef8430ec6bdf36e193413ed5a79994a"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
