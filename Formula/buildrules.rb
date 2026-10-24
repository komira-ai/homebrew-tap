class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.41/buildrules-cli-0.0.41-macos-arm64.tar.gz"
      sha256 "d1b363cfaf5557b320a2685f87ba901c19116d8ad1ed1117f7eb6652a9ed041e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.41/buildrules-cli-0.0.41-linux-aarch64.tar.gz"
      sha256 "182fa8497d3f5300c0ff4a1141f44e7b13b08a137c098b97fe82b007a0d3f5e6"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.41/buildrules-cli-0.0.41-linux-x86_64.tar.gz"
      sha256 "d1d800c2ddfdaa18cf7a920bdea0aaf9ec2012ca42dca3b817a367b7e93b1cd4"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
