class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.28/buildrules-cli-0.0.28-macos-arm64.tar.gz"
      sha256 "b9828ba0da4d9cd90117db3ce388015aaa53dd20fdbffbabbf5c053990b96715"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.28/buildrules-cli-0.0.28-linux-aarch64.tar.gz"
      sha256 "7d30c076d49163fc61f952bdb674668a8fc1e500a6ae35594a6ed604392019c1"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.28/buildrules-cli-0.0.28-linux-x86_64.tar.gz"
      sha256 "02497748cb5b84b164b507bfe0ea11fd5640091eceaf692d1ae4fdfb4b2c0a84"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
