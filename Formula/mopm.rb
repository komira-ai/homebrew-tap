class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.35/mopm-0.0.35-macos-arm64.tar.gz"
      sha256 "e619e734c63387b8cd567e859e863a9266308d4d401873a6e3677453b6530308"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.35/mopm-0.0.35-linux-aarch64.tar.gz"
      sha256 "4eb41c7bec4d271f0c316295af660157c27a9b4777f643c2e6b19aad3cf3be4f"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.35/mopm-0.0.35-linux-x86_64.tar.gz"
      sha256 "459bc734d5c870ef04fc0e7a3032ed3992d2dbc28a2d475bde726ec3256aecdb"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
