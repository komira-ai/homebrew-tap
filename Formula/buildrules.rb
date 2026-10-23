class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.34/buildrules-cli-0.0.34-macos-arm64.tar.gz"
      sha256 "05d09c1d51dcf341708efdf399d6f14cf0d294ccc4af9f788fbab47bcfc6e7cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.34/buildrules-cli-0.0.34-linux-aarch64.tar.gz"
      sha256 "9e76aa84e987427d294ccb2e32da5392c8863dd2d927e29db2b59c05d4d10bd0"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.34/buildrules-cli-0.0.34-linux-x86_64.tar.gz"
      sha256 "b62a9ef5b1d114eabf3ce436a035988f8986c6878e07f814d07a9e549647d768"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
