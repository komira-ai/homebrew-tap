class Buildrules < Formula
  desc "Hermetic Buck2 rules and toolchains"
  homepage "https://buildrules.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.38/buildrules-cli-0.0.38-macos-arm64.tar.gz"
      sha256 "490816c275ff0897e76b007fd0b4cd5bcb5aacfc47aa516dc19b239d3b165b2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.38/buildrules-cli-0.0.38-linux-aarch64.tar.gz"
      sha256 "3fd10204aa136fe008e7cc7030b6141d7fb8c5b1f25c7aab74c153794efda538"
    end
    on_intel do
      url "https://github.com/komira-ai/buildrules/releases/download/v0.0.38/buildrules-cli-0.0.38-linux-x86_64.tar.gz"
      sha256 "984be03ef9425290b9ad2bb1d080bf66a1b20106038f324d109eaa015807a16f"
    end
  end

  def install
    bin.install "buildrules"
  end

  test do
    assert_match "buildrules #{version}", shell_output("#{bin}/buildrules --version")
  end
end
