class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.24/buildrules-cli-0.0.24-macos-arm64.tar.gz"
      sha256 "3c4f095449e61c802bb2a9678455ca73eb26cf4f46b32de08ccc7211b808de1f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.24/buildrules-cli-0.0.24-linux-aarch64.tar.gz"
      sha256 "b418351addbd5be70453e9553c17219e68ab98e757f73a05851107789df6b267"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.24/buildrules-cli-0.0.24-linux-x86_64.tar.gz"
      sha256 "cd8871fa78688f542c95be4791468a0726fc0f41ecb10e2836cdc930b62d1636"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
