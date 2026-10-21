class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.11/buildrules-cli-0.0.11-macos-arm64.tar.gz"
      sha256 "89edfdb2a81283f1b18bfc74fd7f3c6b038a4a342420ff93b66434adc3781869"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.11/buildrules-cli-0.0.11-linux-aarch64.tar.gz"
      sha256 "c566435558758cfdf3e6e6247c55d5aab22e14ae52286b44dc443488b6764aff"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.11/buildrules-cli-0.0.11-linux-x86_64.tar.gz"
      sha256 "41c27e45b3a38fb08d41800051875445d8f74602cea411d2ef608ea3e8c44dae"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
