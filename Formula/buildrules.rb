class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.39/buildrules-cli-0.0.39-macos-arm64.tar.gz"
      sha256 "f8dbd6fad7aa5046e99bef1fa780a33bd764f0a0dda8c4245c127efee047725b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.39/buildrules-cli-0.0.39-linux-aarch64.tar.gz"
      sha256 "d2da1636e4fa6d761e04897064b9a2cac9c8798f7850d1f12f23a397935bf998"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.39/buildrules-cli-0.0.39-linux-x86_64.tar.gz"
      sha256 "66e03ab286668954ef757377950e960af276b9c602782d5fcb974d6376b8ac99"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
