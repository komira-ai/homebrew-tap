class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.129/mopm-0.0.129-macos-arm64.tar.gz"
      sha256 "9e3fb0fc7b29b0240c10cebda869773983b3828891248ad95ff9c8c340bc8ad9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.129/mopm-0.0.129-linux-aarch64.tar.gz"
      sha256 "4f9813b7c73ec8f82740a345b5cf63eba9b31b55cf6cc98c2c5b6cbe9ead6247"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.129/mopm-0.0.129-linux-x86_64.tar.gz"
      sha256 "a77f87ec2dcc49029ae6537782df3987ab3782cf4e03c8ef925111b9f350ba5d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
