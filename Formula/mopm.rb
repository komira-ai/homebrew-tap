class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.66/mopm-0.0.66-macos-arm64.tar.gz"
      sha256 "5d92fee1e7d1600cc3e683ea1a4b01b80f24b45fcf2b566004a430dac321abb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.66/mopm-0.0.66-linux-aarch64.tar.gz"
      sha256 "845920b43a5d000dd519519d64bf182474e77c96a91da922f84dcbdf7362abf0"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.66/mopm-0.0.66-linux-x86_64.tar.gz"
      sha256 "2c63fe54c06a47076299f95fc0d0e169afa4f82f5e49de500d5d029340aa7c1c"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
