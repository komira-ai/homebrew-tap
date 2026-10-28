class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.90/mopm-0.0.90-macos-arm64.tar.gz"
      sha256 "5ff422415536ef0ad3cd3ab46283a4237818212a72040aa50e3b002a294b7901"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.90/mopm-0.0.90-linux-aarch64.tar.gz"
      sha256 "5763e2c483b60e9e57773b0d781cbc26df8c159a37f2cc3eb6207ac1774d63b6"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.90/mopm-0.0.90-linux-x86_64.tar.gz"
      sha256 "d2405051b4e8525681740216f2de60caf192abe28d186e2a45c1fdd0a1e99251"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
