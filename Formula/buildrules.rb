class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.20/buildrules-cli-0.0.20-macos-arm64.tar.gz"
      sha256 "8bbaa7b04c89cbef3e21921fb943b914fb543f75f81cfe3bf18fc9add08ea2e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.20/buildrules-cli-0.0.20-linux-aarch64.tar.gz"
      sha256 "d1082f54ecb8a246eda57bac022787b6ef49f0ab21412546eac832a466d562d1"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.20/buildrules-cli-0.0.20-linux-x86_64.tar.gz"
      sha256 "dc1aadc8bad396df5072ef0ed702b8f61f4c3b03dc9fdc15266d523572017bc8"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
