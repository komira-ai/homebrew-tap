class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.18/buildrules-cli-0.0.18-macos-arm64.tar.gz"
      sha256 "27762d1edf2f680976a4e8db021ac86b1509f8a4e898e4bdb993442d527a1886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.18/buildrules-cli-0.0.18-linux-aarch64.tar.gz"
      sha256 "94e94e7608f41bb7044b52f10508f3b28e62106b30d071214a9716a9a02ff040"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.18/buildrules-cli-0.0.18-linux-x86_64.tar.gz"
      sha256 "08cc93e5c71319d6e7de4cc6edd8411769df94c5ad4ca8e91a087a941e1d9947"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
