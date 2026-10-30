class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.101/mopm-0.0.101-macos-arm64.tar.gz"
      sha256 "99e2083041cc30f6165406fce24a1e2f1c6a91a1e1d55d51393a9a8b23a5333f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.101/mopm-0.0.101-linux-aarch64.tar.gz"
      sha256 "4a9ebecd61801bab1b0d8d00d9c6330681f5f86043aceb35c5ec4546b5ded865"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.101/mopm-0.0.101-linux-x86_64.tar.gz"
      sha256 "07a591f22f52f52f90599f7ac5de356ceface4ec4271d264de972cfc80e276f9"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
