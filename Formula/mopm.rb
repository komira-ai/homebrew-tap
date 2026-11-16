class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.112/mopm-0.0.112-macos-arm64.tar.gz"
      sha256 "79f65d4b8448d2beb6128f3996595991d48c25bd6c267f7d88957f0ac2117be6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.112/mopm-0.0.112-linux-aarch64.tar.gz"
      sha256 "fa77c6e87fcc6af35a65756ae911fccbab985cd8318a441fe1ffcc0384a5408a"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.112/mopm-0.0.112-linux-x86_64.tar.gz"
      sha256 "5182709fcda6a46aeb9bc15abc5db5bed2db3b695bc68eb934cdee008ffde4cb"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
