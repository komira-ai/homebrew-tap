class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.76/mopm-0.0.76-macos-arm64.tar.gz"
      sha256 "2b115e56eab3ec2cf39d40aba59df90ea636719f250eb30769657b146926dbb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.76/mopm-0.0.76-linux-aarch64.tar.gz"
      sha256 "a8afff124742a06a08f5ecb2502fa5ccf0b68046755851233619492caa08d6da"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.76/mopm-0.0.76-linux-x86_64.tar.gz"
      sha256 "fc63cb2ab4096ad1c072cd0743da7ef78599c129e449cead01b902a8f81e175d"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
