class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.67/mopm-0.0.67-macos-arm64.tar.gz"
      sha256 "700d6aaf5559c2faf7bc6c28cea4d9e5a55f24ad83ed163a9e62e8022efaea42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.67/mopm-0.0.67-linux-aarch64.tar.gz"
      sha256 "a4d7790cc9627f6e868ceb183bab21c494d5dbde3c436725f4520557536e42e2"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.67/mopm-0.0.67-linux-x86_64.tar.gz"
      sha256 "62920dc6ed52a0f79850eca163a3ff8d8bab09478e5c9060ef24e6fefeadfb0b"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
