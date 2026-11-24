class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.86/buildrules-cli-0.0.86-macos-arm64.tar.gz"
      sha256 "5ecee9d93c8092c561a2d8ba2350c3d449734cecc47baf282145ed02abac2d49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.86/buildrules-cli-0.0.86-linux-aarch64.tar.gz"
      sha256 "00cfd2455ad4637b02b7548e22ee58c29e036e019db8f0adfb69fbe6175f1e8a"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.86/buildrules-cli-0.0.86-linux-x86_64.tar.gz"
      sha256 "30c682801646cad039911c7799db97a23146f6b6a597d4a43fca512dfa0f8b28"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
