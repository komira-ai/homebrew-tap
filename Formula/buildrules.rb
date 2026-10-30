class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.67/buildrules-cli-0.0.67-macos-arm64.tar.gz"
      sha256 "1bcd03b42769f62b5e4860ea964add9dc0c51bee878d627ed8983ce6c15cedc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.67/buildrules-cli-0.0.67-linux-aarch64.tar.gz"
      sha256 "535b4ddacab521aef4ab9cc9d81515252d53d09b4b1c88998f65fff30d5d9e99"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.67/buildrules-cli-0.0.67-linux-x86_64.tar.gz"
      sha256 "367bd95bfe181fd04e619a731929a1eac9957ab12b21562d7087d17f85f0aa33"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
