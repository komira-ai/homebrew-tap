class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.61/buildrules-cli-0.0.61-macos-arm64.tar.gz"
      sha256 "c262301fd1828bb405d35f1803cc496b56c820ffe1ba29de00df22c28083ed48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.61/buildrules-cli-0.0.61-linux-aarch64.tar.gz"
      sha256 "dfd6bf59a7b45aee170e991b47747897c27b530c2fd8cc59af7dcec7cc46b6a9"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.61/buildrules-cli-0.0.61-linux-x86_64.tar.gz"
      sha256 "eaf0d3a3a39055a22c1da827483d2ce5da1b1fb5c5585826ca12667a62bf0250"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
