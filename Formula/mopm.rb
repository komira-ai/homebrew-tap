class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.68/mopm-0.0.68-macos-arm64.tar.gz"
      sha256 "af3be00bbb5f68a067c91fd4152b00712bf78e5a371a71206690765802774413"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.68/mopm-0.0.68-linux-aarch64.tar.gz"
      sha256 "be60cdfbabb89190169b4349318b700751bbe2a4c0b2e1eeb5da16646f6fa76d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.68/mopm-0.0.68-linux-x86_64.tar.gz"
      sha256 "76ae8371c8bd9c7338d7e1cf13b876e7d2a59695492bd7fbeecdc6632bcb8db9"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
