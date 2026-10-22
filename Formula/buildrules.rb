class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.26/buildrules-cli-0.0.26-macos-arm64.tar.gz"
      sha256 "42c94bd771849a76910e6edeebde6a5d812d6a12ddcfa4adc83e341b3b87d760"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.26/buildrules-cli-0.0.26-linux-aarch64.tar.gz"
      sha256 "b164cd5490c63d00a4c8854cf95449068b3a7df2541fc7a6dd21761954d98d0d"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.26/buildrules-cli-0.0.26-linux-x86_64.tar.gz"
      sha256 "90460db3558d9d46120776c25ca34489fd21d1f654ff6791370e3ece2bd40da6"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
