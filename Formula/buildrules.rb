class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.65/buildrules-cli-0.0.65-macos-arm64.tar.gz"
      sha256 "06f715f2c4c76cf958d01af3ea9e7d80bcace8e07f638dfdcb66ae52e3c81ef5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.65/buildrules-cli-0.0.65-linux-aarch64.tar.gz"
      sha256 "3346e12b2e6a461cb50ec35aae95905e79712a8dd4ee94b1cc9c42dabb97aa4f"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.65/buildrules-cli-0.0.65-linux-x86_64.tar.gz"
      sha256 "b339249ef98a84d3bde26e07f1f5ccef725c4bd0e082eb847001bba5a4474f19"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
