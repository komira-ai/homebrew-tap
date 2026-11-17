class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.76/buildrules-cli-0.0.76-macos-arm64.tar.gz"
      sha256 "1cdd9e2e23abcec6f43a73a54ba332ebd943bccb88f2a21b07496deb832c1880"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.76/buildrules-cli-0.0.76-linux-aarch64.tar.gz"
      sha256 "1dbe8ab7555e8e70d5c05a24d5c295a08588dc2962b9635e516ccc6719d31ca1"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.76/buildrules-cli-0.0.76-linux-x86_64.tar.gz"
      sha256 "8aec3dc5d558ad38a7a3fc8705518809138ae8fcd7640c10cda9a9e462897adf"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
