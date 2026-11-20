class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.132/mopm-0.0.132-macos-arm64.tar.gz"
      sha256 "f9d9a3c228a44b0744fa98f4a69f7be9b186b8f000640c36d9b67f07123791c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.132/mopm-0.0.132-linux-aarch64.tar.gz"
      sha256 "a3eda025910666b06293467efabbe85b1839e53be8200a1658dc15408aaad2a3"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.132/mopm-0.0.132-linux-x86_64.tar.gz"
      sha256 "34aea1a891e830065a9c982e96ebe6c44b1a524d9924a2b9bb113b993258c2d6"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
