class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.37/buildrules-cli-0.0.37-macos-arm64.tar.gz"
      sha256 "a4760f064cd9a622e5f65b211c64f34d373751756c1028293a9466710d187be9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.37/buildrules-cli-0.0.37-linux-aarch64.tar.gz"
      sha256 "0a40f332c3c5639bb0e6b20b1a112bde71dbab601f25cca881bd1ad9beb0534a"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.37/buildrules-cli-0.0.37-linux-x86_64.tar.gz"
      sha256 "1fba97a6b49cfb15e573d0452e84e51d21816012444d1066e13a7f2463f9cbf1"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
