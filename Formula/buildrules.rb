class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.15/buildrules-cli-0.0.15-macos-arm64.tar.gz"
      sha256 "602ec249c7eda0f84edcea18d7a1afa153d3b34ca0edbc45a4c474d0d4cc7b8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.15/buildrules-cli-0.0.15-linux-aarch64.tar.gz"
      sha256 "2de689134f293585fc1a4931ae31351058c5e4576e27a63ed6ef3ed56bbba443"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.15/buildrules-cli-0.0.15-linux-x86_64.tar.gz"
      sha256 "17f8fc1b72ddab413551417f7db7532bf0d0d42cf4b5cefbe3947bb5a1280170"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
