class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.125/mopm-0.0.125-macos-arm64.tar.gz"
      sha256 "c987a0d9e666a4ed8d03c64c8efe3e4194fa2e02d103037a9ba78ddc202b72ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.125/mopm-0.0.125-linux-aarch64.tar.gz"
      sha256 "4a20d5c7b07ffcf3e1cb432f3256b25bc00c5e6dc821800cd1284dc2169b9555"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.125/mopm-0.0.125-linux-x86_64.tar.gz"
      sha256 "83d648dfbb7dd697b20e4cfe89723b9e5a9158fb91daf621771d11ce9b52a584"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
